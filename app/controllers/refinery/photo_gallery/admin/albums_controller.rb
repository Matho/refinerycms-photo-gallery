module Refinery
  module PhotoGallery
    module Admin
      class AlbumsController < ::Refinery::AdminController
        cache_sweeper AlbumSweeper
        crudify :'refinery/photo_gallery/album', :order => "created_at DESC" , :xhr_paging => true

        def create
          @album = Album.new(params[:album])

          if @album.save(params[:album])
            flash[:notice]= t('refinery.crudify.created',:what => "'#{@album.title}'" )

            redirect_to  refinery.upload_photo_gallery_admin_album_photos_path(@album)
          else
            render "new"
          end
        end

      end
    end
  end
end