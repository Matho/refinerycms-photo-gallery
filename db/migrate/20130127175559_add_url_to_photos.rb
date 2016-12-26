class AddUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :refinery_photo_gallery_photos, :url, :string
  end
end
