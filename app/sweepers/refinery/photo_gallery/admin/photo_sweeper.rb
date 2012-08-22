module Refinery
  module PhotoGallery
    module Admin
      class PhotoSweeper < ActionController::Caching::Sweeper
        observe Photo

        def sweep(photo)
          # only file store supports regexp
          if  Rails.cache.class.to_s == "ActiveSupport::Cache::FileStore"
            # TODO This is slow, but I was unable to get the actual cache folder path. This should be replaced with FileUtils.rm to get better speed
            expire_fragment( %r{refinery/photo_gallery/albums/#{photo.album_id}/page_\d*})
          end
        end

        alias_method :after_create, :sweep
        alias_method :after_update, :sweep
        alias_method :after_destroy, :sweep
      end
    end
  end
end
