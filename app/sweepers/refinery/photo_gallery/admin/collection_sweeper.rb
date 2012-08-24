module Refinery
  module PhotoGallery
    module Admin
      class CollectionSweeper < ActionController::Caching::Sweeper
        observe Collection


        def sweep_collection(collection)
          expire_fragment("refinery/photo_gallery/submenu")
        end


        alias_method :after_create,  :sweep_collection
        alias_method :after_update,  :sweep_collection
        alias_method :after_destroy, :sweep_collection
      end
    end
  end
end
