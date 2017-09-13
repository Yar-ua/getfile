class AddColumnType < ActiveRecord::Migration[5.1]
  def change
  	add_column :stored_files, :filetype, :text
  end
end
