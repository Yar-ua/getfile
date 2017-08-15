class StoredFilesController < ApplicationController
  
  def index
    @files = StoredFile.all.order('created_at DESC')
  end


  def new
  	#
  end

  def create
  	@file = StoredFile.new(file_params)

  end


  private

  def file_params
    params.require(:file).permit(:description)
  end
  
end
