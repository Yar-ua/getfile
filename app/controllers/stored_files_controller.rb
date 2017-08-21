class StoredFilesController < ApplicationController
  
  def index
    #@files = StoredFile.all.order('created_at DESC')
    #@new_file = StoredFile.new
  end


  def new
  	#
  end

  def create
  	uploaded_io = params[:upload]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      # изменяем кодировку файлов на utd-8, чтобы загружать файлы любой кодировки
      file.write(uploaded_io.read.force_encoding("utf-8"))
    end
    redirect_to :root
  end


  private

  def file_params
    params.require(:file).permit(:description)
  end
  
end
