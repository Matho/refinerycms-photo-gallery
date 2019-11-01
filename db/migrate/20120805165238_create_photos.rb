class CreatePhotos < ActiveRecord::Migration[4.2]
  def self.up
    create_table Refinery::PhotoGallery::Photo.table_name  do |t|
      t.string :title, :length => 250, :null => false
      t.text :description
      t.string :path, :length => 100, :null=> true
      t.decimal :longitude, :precision => 15, :scale => 10
      t.decimal :latitude, :precision => 15, :scale => 10
      t.string :file

      t.references :album
      t.timestamps
    end
  end

  def self.down
    drop_table Refinery::PhotoGallery::Photo.table_name
  end
end
