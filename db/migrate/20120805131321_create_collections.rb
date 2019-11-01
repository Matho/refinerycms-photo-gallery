class CreateCollections < ActiveRecord::Migration[4.2]
  def self.up
    create_table Refinery::PhotoGallery::Collection.table_name do |t|
      t.string :title, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table Refinery::PhotoGallery::Collection.table_name
  end
end
