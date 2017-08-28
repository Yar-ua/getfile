class StoredFilesController < ApplicationController

  # перед экшеном определяем скачиваемый файл
  before_action :set_file, only: [:update, :destroy]
  before_action :set_all_files  #, only: [:index]
  

  def index

  end


  def create
    temp = file_params
    
    # проверяем, выбран ли загружаемый файл, если нет - отбиваем alert
    if temp[:upload] == nil
      redirect_to root_path, alert: 'Нельзя загружать пустоту - Вы должны выбрать файл для загрузки'

    # если загружаемый фал выбран
    else
      @new_file = StoredFile.new(name: temp[:upload].original_filename, 
                                description: temp[:description],
                                size: temp[:upload].size)

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


  def update
    # перед экшеном выполняется запрос текущего объекта в ф-ии get_file
    send_file Rails.root.join('public', 'uploads', @file.name), filename: @file.name, type: 'Application/octet-stream' #disposition: "inline"
    @file.downloads += 1
    @file.save
    render :index
  end


  def destroy
    File.delete(Rails.root.join('public', 'uploads', @file.name))
    @file.destroy
    redirect_to root_path, notice: 'Файл был удален'
  end


  private


  def file_params
    params.require(:new_file).permit(:description, :upload)
  end


  def set_file
    @file = StoredFile.find(params[:id])
  end

  def set_all_files
    @files = StoredFile.all.order('created_at DESC')
  end
  
end
