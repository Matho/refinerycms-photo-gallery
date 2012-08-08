class CreateCollectionAlbums < ActiveRecord::Migration
  def self.up
    create_table Refinery::PhotoGallery::CollectionAlbum.table_name do |t| #TODO primary id to false
      t.references :collection
      t.references :album
    end
  end

  def self.down
    drop_table Refinery::PhotoGallery::CollectionAlbum.table_name
  end
end
