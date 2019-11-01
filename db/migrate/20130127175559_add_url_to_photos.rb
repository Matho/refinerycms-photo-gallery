class AddUrlToPhotos < ActiveRecord::Migration[4.2]
  def change
    add_column :refinery_photo_gallery_photos, :url, :string
  end
end
