class AddDownloadsToStoredFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :stored_files, :downloads, :integer, null: false, default: 0
  end
end
