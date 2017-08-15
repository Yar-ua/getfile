class CreateStoredFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :stored_files do |t|
      t.string	:filename, null: false		# имя файла
      t.text	:description, null: false	# описание файла
      t.integer	:size						# размер файла

      t.timestamps
    end
  end
end
