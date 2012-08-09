module Refinery
  module PhotoGallery
    class AlbumsController < ::ApplicationController
      include PhotoGalleryHelper, AlbumsHelper
      helper :'refinery/photo_gallery/photo_gallery'


      def show
        @collections = Collection.has_albums

        @albums = Album.find_by_collection_id(params[:collection_id])
	@album = Album.find(params[:id])

        @photos = Photo.where("album_id = ? ", params[:id]).paginate(:page => params[:page])

        respond_to do |format|
          format.html
        end
      end
    end
  end
end
