class StoredFilesController < ApplicationController
  
  def index
    @files = StoredFile.all.order('created_at DESC')
    @new_file = StoredFile.new
  end


  def new
  	#
  end

  def create
    temp = file_params
    @new_file = StoredFile.new(name: temp[:upload].original_filename, 
                                description: temp[:description],
                                size: temp[:upload].size)

  	uploaded_io = params[:new_file][:upload]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      # изменяем кодировку файлов на utf-8, чтобы загружать файлы любой кодировки
      file.write(uploaded_io.read.force_encoding("utf-8"))
    end

    @new_file.save
    #redirect_to root_path
  end


  private

  def file_params
    params.require(:new_file).permit(:description, :upload)
  end
  
end
