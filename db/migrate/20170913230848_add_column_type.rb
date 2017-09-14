class AddColumnType < ActiveRecord::Migration[5.1]
  def change
  	# добавляем колонку расширение файла
  	add_column :stored_files, :ext, :text
  	# добавляем колонку 'тип файла': видео, аудио и т д
  	add_column :stored_files, :filetype, :text
  end
end
