module Refinery
  module PhotoGallery
    class CollectionAlbum < ActiveRecord::Base
      belongs_to :album
      belongs_to :collection
    end
  end
end