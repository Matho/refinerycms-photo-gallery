module Refinery
  module PhotoGallery
    module AlbumsHelper

      def photo_description(photo, photos, index)
         t('.image') + ' ' + (index + 1 ).to_s + '/' + photos.length.to_s + ' ' + photo.title + '<br/><br/>' + photo.description
      end

    end
  end
end