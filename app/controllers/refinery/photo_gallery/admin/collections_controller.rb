module Refinery
  module PhotoGallery
    module Admin
      class CollectionsController < ::Refinery::AdminController

        crudify :'refinery/photo_gallery/collection', :order => "created_at DESC" , :xhr_paging => true

        protected

        def collection_params
          params.require(:collection).permit(:title, :description)
        end

        alias_method :new_collection_params, :collection_params
      end
    end
  end
end
