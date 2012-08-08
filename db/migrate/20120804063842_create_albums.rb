class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table "refinery_photo_gallery_albums" do |t|
      t.string :title, :length => 250, :null => false
      t.text :description
      t.string :path, :length => 100, :null=> true
      t.string :address, :length => 200, :null=> true
      t.decimal :longitude, :precision => 15, :scale => 10
      t.decimal :latitude, :precision => 15, :scale => 10
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table "refinery_photo_gallery_albums"
  end
end
