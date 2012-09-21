module Refinery
  module PhotoGallery
    module Extensions
      module PagesController
        def load_helpers
=begin
            Refinery::PagesController.class_eval do
              include Refinery::PhotoGallery::PhotoGalleryHelper
               helper :'refinery/photo_gallery/photo_gallery'

            end
=end

        end
      end
    end
  end
end

