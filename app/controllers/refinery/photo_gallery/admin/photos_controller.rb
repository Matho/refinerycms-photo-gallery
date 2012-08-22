# encoding: UTF-8

module Refinery
  module PhotoGallery
    module Admin
      class PhotosController < ::Refinery::AdminController
        include PhotosHelper
        helper :"refinery/photo_gallery/admin/photos"
        cache_sweeper PhotoSweeper

        #TODO delete update method from routes
        #TODO delete edit action from routes

        #TODO after destroying album, delete empty folders

        def upload
          @album = Album.find( params[:album_id])
        end

        def create
          @photo = Photo.new(params[:photo])
          @photo.file = params[:file]

          if @photo.save!
            render :partial=> 'form_fields', :locals => {:photo => @photo }
          else
            render :text =>  @photo.errors.full_messages.join(" "), :status=> 500
          end
        end

        def edit_multiple
          @album = Album.find( params[:album_id] )
          @photos = @album.photos.order("created_at DESC")
        end


        def update_multiple
          photo_ids = params[:photos][:photo].map{ |key, hash| key }

          @photos = Photo.find(photo_ids)
          @photos.each do |photo|
            photo.update_attributes(params[:photos][:photo][photo.id.to_s]) #TODO use ! method and validate exceptions
          end

          flash[:notice] = t('updated', :scope=> 'refinery.photo_gallery.admin.photos')
          redirect_to refinery.photo_gallery_admin_albums_path
        end


        def destroy
          @photo = Photo.find( params[:id])

          if @photo.destroy
            respond_to do |format|
              format.js {
                render :partial=> "destroy", :locals => {:photo => @photo}
              }
            end
          else
             render :text => "Error" , :status=> 500
          end
        end


      end
    end
  end
end