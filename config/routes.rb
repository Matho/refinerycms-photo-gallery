Refinery::Core::Engine.routes.draw do

  # To have unique url adress in Google
  get "*path/page/1" => redirect("/%{path}")
  get "*path/page/:page" => "pages#show", :as => :page, :constraints => {:page => /[1-9]+/} # 1-9 because I want will_paginate render page/1 link for XHR, but I dont want page/1 for non-XHR


  namespace "photo_gallery", :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'photo-gallery' do
        root :to => "albums#index"

        resources :photos do
          collection do
            put :update_multiple
          end
        end

        resources :albums do
          resources :photos do
            collection do
              get :upload
              get :edit_multiple
            end
          end
        end

        resources :collections

      end
    end
  end
end
