module Refinery
  module PhotoGallery
    module Extensions
      module PagesController

        def self.included(base)
          base.class_eval do
            before_filter :ajax_photo_gallery, :only => :show


            def ajax_photo_gallery
              # this is only for fragment caching to create 1 cache file version for first page
              params[:page].blank? ? params[:page] = 1 : params[:page]

              if request.xhr?
                respond_to do |format|
                  format.js { render :partial=> "/refinery/photo_gallery/albums/photos"}
                end
              end
            end

          end
        end
      end
    end
  end
end
