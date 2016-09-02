module Refinery
  module PhotoGallery
    module Admin
      module PhotosHelper

        def get_filename_part(filename)
          if filename.present?
            filename[0, filename.rindex('.') ]
          else
            ""
          end
        end
      end
    end
  end
end
