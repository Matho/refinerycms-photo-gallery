module Refinery
  module PhotoGallery
    include ActiveSupport::Configurable

    config_accessor :runtimes, :max_file_size,:client_side_resize, :client_side_resize_params, :plupload_locale, :extension_white_list,:photo_gallery_dir,
                    :delete_uploaded_file,:collection_dimensions, :album_dimensions, :preview_dimensions, :single_dimensions, :photo_gallery_dir_relative_to_root,
                    :photos_per_page, :albums_per_page, :collections_per_page



    self.runtimes = 'html5,flash,browserplus,silverlight,gears'
    self.max_file_size = '10mb'
    #TODO or per album?
    #TODO by default false!
    self.client_side_resize = true
    self.client_side_resize_params = {:width => 800, :height=> 600, :quality=> 100}
    #TODO leave blank before publishing this gem!
    self.plupload_locale = ''
    self.extension_white_list = %w(jpg jpeg gif png bmp tiff)
    self.photo_gallery_dir = "/system/refinery/photo_gallery"
    self.photo_gallery_dir_relative_to_root = '/public' + self.photo_gallery_dir
    #TODO or per album?
    self.delete_uploaded_file = true
    self.collection_dimensions = [200, 200]
    self.album_dimensions = [150, 150]
    self.preview_dimensions = [210, 210]
    self.single_dimensions = [950, 950]

    self.albums_per_page = 10
    self.collections_per_page = 10
    self.photos_per_page = 10
  end
end
