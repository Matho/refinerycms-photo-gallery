module Refinery
  module PhotoGallery
    module Admin
      class AlbumSweeper < ActionController::Caching::Sweeper
        observe Album

        def sweep_album(album)
          expire_fragment("refinery/photo_gallery/albums/#{album.id}")
        end

        def sweep_album_with_photos(album)
          sweep_album(album)

          # only file store supports regexp
          if  Rails.cache.class.to_s == "ActiveSupport::Cache::FileStore"
            expire_fragment( %r{refinery/photo_gallery/albums/#{album.id}/page_\d*})
          end
        end

        alias_method :after_create,  :sweep_album
        alias_method :after_update,  :sweep_album
        alias_method :after_destroy, :sweep_album_with_photos
      end
    end
  end
end
