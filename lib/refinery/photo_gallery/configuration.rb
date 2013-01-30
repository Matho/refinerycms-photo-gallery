module Refinery
  module PhotoGallery
    include ActiveSupport::Configurable

    config_accessor :runtimes, :max_file_size,:client_side_resize, :client_side_resize_params, :plupload_locale, :extension_white_list,:photo_gallery_dir,
                    :delete_uploaded_file,:collection_dimensions, :album_dimensions, :preview_dimensions, :single_dimensions, :photo_gallery_dir_relative_to_root,
                    :photos_per_page, :albums_per_page, :collections_per_page,
                    :admin_photo_options_show_url, :admin_photo_options_show_css_class,
                    :admin_photo_options_show_preview_type



    #self.runtimes = 'html5,flash,browserplus,silverlight,gears'
    self.runtimes = 'html5'
    self.max_file_size = '10mb'
    self.client_side_resize = true
    self.client_side_resize_params = {:width => 950, :height=> 950, :quality=> 100}
    self.plupload_locale = Refinery::I18n.default_locale.to_s
    self.extension_white_list = %w(jpg jpeg gif png bmp tiff)
    self.photo_gallery_dir = "/system/refinery/photo_gallery"
    self.photo_gallery_dir_relative_to_root = '/public' + self.photo_gallery_dir
    #TODO or per album?
    self.delete_uploaded_file = true
    #self.collection_dimensions = [200, 200]
    self.album_dimensions = [140, 105]
    self.preview_dimensions = [210, 210]
    self.single_dimensions = [900, 900]

    self.albums_per_page = 10
    self.collections_per_page = 10
    self.photos_per_page = 10

    self.admin_photo_options_show_url = true
    self.admin_photo_options_show_css_class = true
    self.admin_photo_options_show_preview_type = true
  end
end
