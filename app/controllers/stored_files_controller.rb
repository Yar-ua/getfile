class StoredFilesController < ApplicationController
  
  def index
    @files = StoredFile.all.order('created_at DESC')
    @new_file = StoredFile.new
  end


  def new
  	#
  end

  def create
  	uploaded_io = params[:upload]   # encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_')
#    uploaded_io = uploaded_io.encode('utf-8')
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to :root
  end


  private

  def file_params
    params.require(:file).permit(:description)
  end
  
end
