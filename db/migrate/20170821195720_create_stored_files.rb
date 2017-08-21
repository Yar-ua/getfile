class CreateStoredFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :stored_files do |t|
      t.string :name, unique: true
      t.text :description
      t.string :size
      
      t.index :name
      t.index :description

      t.timestamps
    end

    # индексируем имя и описание файла для ускорения поиска (если ввести в дальнейшем функцию поиска)
    #add_index :name
    #add_index :description
  end
end
