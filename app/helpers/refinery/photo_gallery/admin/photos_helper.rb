module Refinery
  module PhotoGallery
    module Admin
      module PhotosHelper

        def get_filename_part(filename)
          filename[0, filename.rindex('.') ]
        end
      end
    end
  end
end
