# encoding: UTF-8

module Refinery
  module PhotoGallery
    module Admin
      class PhotosController < ::Refinery::AdminController
        include PhotosHelper

        #TODO delete update method from routes
        #TODO delete edit action from routes

        #TODO after destroying album, delete empty folders

        def upload
          @album = Album.find( params[:album_id].to_i)
        end

        def create
          @photo = Photo.new(new_photo_params)
          @photo.file = params[:file]
          @photo.title = get_filename_part(params[:name])

          if @photo.save!
            render :partial=> 'form_fields', :locals => {:photo => @photo }
          else
            render :text =>  @photo.errors.full_messages.join(" "), :status=> 500
          end
        end

        def edit_multiple
          @album = Album.find( params[:album_id].to_i )
          @photos = @album.photos.order("created_at DESC")
        end


        def update_multiple
          photo_ids = update_multiple_photo_params["photo"].keys

          @photos = Photo.find(photo_ids)
          @photos.each do |photo|
            photo.update_attributes(update_multiple_photo_params["photo"][photo.id.to_s]) #TODO use ! method and validate exceptions
          end

          flash[:notice] = t('updated', :scope=> 'refinery.photo_gallery.admin.photos')
          redirect_to refinery.photo_gallery_admin_albums_path
        end


        def destroy
          @photo = Photo.find( params[:id].to_i)

          if @photo.destroy
            respond_to do |format|
              format.html {
                redirect_to refinery.photo_gallery_admin_albums_path
              }
              format.js {
                render :partial=> "destroy", :locals => {:photo => @photo}
              }
            end
          else
             render :text => "Error" , :status=> 500
          end
        end

        protected

        def update_multiple_photo_params
          params.require(:photos).permit(:photo => [ :id, :title, :description, :url, :css_class, :preview_type, :longitude, :latitude ] )
        end

        def photo_params
          params.require(:photo).permit(:album_id, :title, :description, :longitude, :latitude, :url, :css_class, :preview_type)
        end

        alias_method :new_photo_params, :photo_params
      end
    end
  end
end
