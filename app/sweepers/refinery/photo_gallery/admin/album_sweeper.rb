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
          begin
            # This is slow, but I was unable to get the actual cache folder path.
            expire_fragment( %r{refinery/photo_gallery/albums/#{photo.album_id}/page/\d*})
          rescue NotImplementedError
            Rails.cache.clear
            warn "**** [REFINERY PHOTO GALLERY] The cache store you are using is not compatible with this engine. Only file_store is supported. Clearing entire cache instead ***"
          ensure
            return true
          end
        end

        alias_method :after_create,  :sweep_album
        alias_method :after_update,  :sweep_album
        alias_method :after_destroy, :sweep_album_with_photos
      end
    end
  end
end
