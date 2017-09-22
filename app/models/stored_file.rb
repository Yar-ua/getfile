class StoredFile < ApplicationRecord

  validates :name, presence: true

  def describe_type
  	# определяем в массивах типы файлов для поиска типа
  	videoarray = ['.avi', '.mkv', '.mov', '.mp4', '.mpeg', '.webm', '.ogv']
  	audioarray = ['.mp3', '.wav']
  	imagearray = ['.jpg', '.jpeg', '.bmp', '.png']

    # получаем из оюъекта расширение сохраненного файла для сравнения
  	required = self.ext

  	if videoarray.include?(required)
  	  return 'video'
  	elsif audioarray.include?(required)
      return 'audio'
    elsif imagearray.include?(required)
      return 'image'
    else
      return 'unknown'
    end
  end

end
