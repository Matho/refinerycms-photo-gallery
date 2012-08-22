module Refinery
  module PhotoGallery
    module PhotoGalleryHelper

      def message_albums_length_is_zero
        if @albums.nil?
          t('.no_albums')
        end
      end

      def message_photos_length_is_zero
        if @photos.nil?
          t('.no_photos')
        end
      end

      def message_collections_length_is_zero
        if @collections.nil?
          t('.no_collections')
        end
      end



      def generate_photo_gallery_menu( collections, albums, options = {} )
        content_tag(:ul, {}, options[:ul] ) do
          collections.each do |collection|

            if params[:collection_id].present? &&  params[:id].present? # in albums controller
              collection_id = params[:collection_id]
            elsif params[:id].present? #in collection controller
              collection_id = params[:id]
            else
              collection_id = 0 #only ensure initialization
            end

            concat(content_tag(:li,  {}, options[:li]) do
              concat(link_to collection.title, refinery.photo_gallery_collection_path(collection))

              # display albums of active collection
              concat(content_tag(:ul, {}, options[:ul] ) do
                if collection_id  == collection.id.to_s
                  albums.each do |album|
                    concat(content_tag(:li,  {}, options[:li]) do
                      link_to album.title, refinery.photo_gallery_collection_album_path({:id=> album.id, :collection_id => collection_id})
                    end )
                  end
                end
              end )


            end)
          end
        end
      end
    end
  end
end