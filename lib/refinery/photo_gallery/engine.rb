module Refinery
  module PhotoGallery
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::PhotoGallery
      engine_name :refinery_photo_gallery

      def self.register(tab)
        tab.name = tab.name = ::I18n.t(:'refinery.plugins.refinerycms_photo_gallery.tab_name')
        tab.partial = "/refinery/admin/pages/tabs/photo_gallery"
      end

      initializer "init plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_photo_gallery"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.photo_gallery_admin_albums_path }
          plugin.menu_match =  %r{refinery/photo_gallery(/.+?)?$}
          plugin.activity = { :class_name => 'Refinery::PhotoGallery::Album' }
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        Refinery::Page.send :has_one_page_album
        Refinery::PagesController.send :include, Refinery::PhotoGallery::Extensions::PagesController
      end

      config.before_initialize do
        require 'carrierwave'
        require 'carrierwave/orm/activerecord'
        #require 'carrierwave/processing/mini_magick'
        #require 'mime/types'
        require 'mini_exiftool'
      end


      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          register tab
        end

        Refinery.register_engine(Refinery::PhotoGallery)
      end
    end
  end
end
