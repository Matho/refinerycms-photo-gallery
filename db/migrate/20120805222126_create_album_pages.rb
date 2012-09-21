class CreateAlbumPages < ActiveRecord::Migration

  def up
    create_table :refinery_album_pages do |t|
      t.integer :album_id
      t.integer :page_id
      t.string  :page_type, :default => "Refinery::Page"
    end

    add_index :refinery_album_pages, :album_id
    add_index :refinery_album_pages, :page_id

  end

  def down
    drop_table :refinery_album_pages
  end

end
