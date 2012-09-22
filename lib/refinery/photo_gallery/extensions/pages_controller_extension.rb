module Refinery
  module PhotoGallery
    module Extensions
      module PagesController

        def self.included(base)
          base.class_eval do
            around_filter :wrap_show_action, :only => :show


            def wrap_show_action
              params[:page].blank? ? params[:page] = 1 : params[:page]

              if request.xhr?
                respond_to do |format|
                  format.js { render :partial=> "/refinery/photo_gallery/albums/photos"}
                end
              else
                show
              end
            end

          end
        end
      end
    end
  end
end
