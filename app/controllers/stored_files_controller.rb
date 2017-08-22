class StoredFilesController < ApplicationController
  

  def index
    @files = StoredFile.all.order('created_at DESC')
  end


  def create
    temp = file_params
    
    # проверяем, выбран ли загружаемый файл, если нет - отбиваем alert
    #if temp[:upload] != nil
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

    #else
    #  redirect_to root_path, alert: 'Вы должны выбрать файл для загрузки'
    #end
  end


  private

  def file_params
    params.require(:new_file).permit(:description, :upload)
  end
  
end
