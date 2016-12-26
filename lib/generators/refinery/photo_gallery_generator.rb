module Refinery
  class PhotoGalleryGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)


    def generate_photo_gallery_initializer
      template 'config/initializers/refinery/photo_gallery.rb.erb', File.join(destination_root, 'config', 'initializers', 'refinery', 'photo_gallery.rb')
    end


    def rake_db
      rake("refinery_photo_gallery:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS PhotoGallery engine
Refinery::PhotoGallery::Engine.load_seed
        EOH
      end
    end

  end
end
