class StoredFile < ApplicationRecord

  validates :name, presence: true

  def describe_type
  	# определяем в массивах типы файлов для поиска типа
  	videoarray = ['.avi', '.mkv', '.mov', '.mp4', '.mpeg', '.webm', '.ogv']
  	audioarray = ['.mp3', '.wav', '.aac']
  	imagearray = ['.jpg', '.jpeg', '.bmp', '.png']
    archievearray = ['.rar', '.zip', '.7z', '.tar', '.deb', '.pkg', '.rpm' '.gzip']
    docarray = ['.doc', '.docx', '.xls', '.xlsx', '.pdf', '.ppt', '.rtf']

    # получаем из оюъекта расширение сохраненного файла для сравнения
  	required = self.ext

  	if videoarray.include?(required)
  	  return 'video'
  	elsif audioarray.include?(required)
      return 'audio'
    elsif imagearray.include?(required)
      return 'image'
    elsif archievearray.include?(required)
      return 'archieve'
    elsif docearray.include?(required)
      return 'document'
    else
      return 'unknown'
    end
  end

end
