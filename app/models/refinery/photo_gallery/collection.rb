module Refinery
  module PhotoGallery
    class Collection < ActiveRecord::Base
      has_many :collection_albums
      has_many :albums, :through => :collection_albums

      #TODO Allow to remove collection only if no album belongs to it


      validates :title, :presence => true

      self.per_page = Refinery::PhotoGallery.collections_per_page

      def self.has_albums
        select("refinery_photo_gallery_collections.*").uniq.
            joins(:collection_albums).
            order('created_at DESC, title ASC')
      end

=begin
      def to_param
        "#{id}-#{title.parameterize}"
      end
=end

    end
  end
end