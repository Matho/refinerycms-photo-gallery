class AddCssStylesAndShowOriginalFieldsToPhotos < ActiveRecord::Migration
  def change
    add_column :refinery_photo_gallery_photos, :css_class, :string
    add_column :refinery_photo_gallery_photos, :preview_type, :string
  end
end
