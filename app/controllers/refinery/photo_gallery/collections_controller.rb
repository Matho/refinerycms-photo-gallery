module Refinery
  module PhotoGallery
    class CollectionsController < ::ApplicationController
      include PhotoGalleryHelper
      helper :'refinery/photo_gallery/photo_gallery'

      def index
        @collections = Collection.has_albums

        respond_to do |format|
          format.html
        end
      end

      def show
        @collections = Collection.has_albums

        @albums = Album.find_by_collection_id(params[:id])

        respond_to do |format|
          format.html
        end
      end


    end
  end
end