module Refinery
  module PhotoGallery
    module Admin
      class AlbumsController < ::Refinery::AdminController
        crudify :'refinery/photo_gallery/album', :order => "created_at DESC" , :xhr_paging => true

        def create
          @album = Album.new(album_params)

          if @album.save
            flash[:notice]= t('refinery.crudify.created',:what => "'#{@album.title}'" )

            redirect_to  refinery.upload_photo_gallery_admin_album_photos_path(@album)
          else
            render "new"
          end
        end

        protected

        def album_params
          params.require(:album).permit(:title, :description, :address, :note, :tags, :longitude, :latitude, :path, :path_prefix, :collection_ids => [])
        end

        alias_method :new_album_params, :album_params
        alias_method :edit_album_params, :album_params

      end
    end
  end
end