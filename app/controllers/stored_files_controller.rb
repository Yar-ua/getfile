class StoredFilesController < ApplicationController
  include StoredFilesHelper

  # перед экшеном определяем скачиваемый файл
  before_action :set_file, only: [:show, :update, :destroy]
  before_action :set_all_files
  

  def index

  end


  def new
    @new_file = StoredFile.new
  end


  def create
    # создается объект класса File
    temp = file_params
    
    # проверяем, выбран ли загружаемый файл, если нет - отбиваем alert
    if temp[:upload] == nil
      redirect_to root_path, alert: 'Нельзя загружать пустоту - Вы должны выбрать файл для загрузки'

    # если загружаемый фал выбран
    else
      @new_file = StoredFile.new(name: temp[:upload].original_filename, 
                                description: temp[:description],
                                size: temp[:upload].size,
                                ext: File.extname(temp[:upload].original_filename) )

      @new_file[:filetype] = @new_file.describe_type

  	  uploaded_io = params[:new_file][:upload]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
        # изменяем кодировку файлов на utf-8, чтобы загружать файлы любой кодировки
        file.write(uploaded_io.read.force_encoding("utf-8"))
      end

      if @new_file.save
        redirect_to root_path, notice: 'Файл успешно загружен'
      else
        redirect_to root_path, alert: 'Файл не загружен, что то пошло не так' 
      end

    end
  end


  def show

  end


  def update
    # перед экшеном выполняется запрос текущего объекта в ф-ии get_file
    send_file Rails.root.join('public', 'uploads', @file.name), filename: @file.name, type: 'Application/octet-stream', disposition: "attachment" #disposition: "inline"
    @file.downloads += 1
    @file.update(downloads: @file.downloads)
  end


  def destroy
    File.delete(Rails.root.join('public', 'uploads', @file.name))
    @file.destroy
    redirect_to root_path, notice: 'Файл был удален'
  
  end

  # экшены для выбора нужных типов файлов из списка

  def select_filelist
    # получаем список файлов в зависимости от типа файла через процедуру set_filelist_by_type
    # параметр :filetype передается из ссылки link_to вьюхи index
    set_filelist_by_type
    render action: :index
  end

  
  private


  def file_params
    params.require(:new_file).permit(:description, :upload)
  end


  def set_file
    @file = StoredFile.find(params[:id])
  end


  def set_all_files
    @files = StoredFile.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
  
  
  def set_filelist_by_type
    @files = StoredFile.where(filetype: params[:filetype]).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

end
