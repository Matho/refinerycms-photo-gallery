require 'refinerycms-core'
require 'refinerycms-settings'


module Refinery
  autoload :PhotoGalleryGenerator, 'generators/refinery/photo_gallery_generator'

  module PhotoGallery
    require 'refinery/photo_gallery/engine'
    require 'refinery/photo_gallery/configuration'

    autoload :Version, 'refinery/photo_gallery/version'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def version
        ::Refinery::PhotoGallery::Version.to_s
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end