module Refinery
  module PhotoGallery
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::PhotoGallery

      initializer "init plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_photo_gallery"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.photo_gallery_admin_albums_path }
          plugin.menu_match =  %r{refinery/photo_gallery(/.+?)?$}
          plugin.activity = { :class_name => 'Refinery::PhotoGallery::Album' }
        end
      end

      config.before_initialize do
        require 'carrierwave'
        require 'carrierwave/orm/activerecord'
        #require 'carrierwave/processing/mini_magick'
        #require 'mime/types'
        require 'mini_exiftool'
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::PhotoGallery)
      end


    end
  end
end
