module Refinery
  module PhotoGallery
    class Album < ActiveRecord::Base
      has_many :photos, :dependent => :destroy
      has_many :collection_albums , :dependent => :destroy
      has_many :collections, :through => :collection_albums

      before_validation :set_path
      validates :title, :presence => true
      validates :path, :presence => true, :uniqueness => true

      attr_accessor :path_prefix
      attr_accessible :title, :description, :address, :note, :tags, :longitude, :latitude, :path, :path_prefix, :collection_ids
      acts_as_indexed :fields => [:title, :description]

      self.per_page = Refinery::PhotoGallery.albums_per_page

      scope :find_by_collection_id, lambda {|collection_id|
            select("refinery_photo_gallery_albums.*").
            joins(:collection_albums).
            where("refinery_photo_gallery_collection_albums.collection_id = ?
                    ", collection_id).
            order('created_at DESC, title ASC')
      }
=begin
#TODO marked photo as photo album preview
      scope :find_by_collection_id, lambda {|collection_id|
        select("refinery_photo_gallery_albums.*, refinery_photo_gallery_photos.file").
            joins(:collection_albums, :photos).
            where("refinery_photo_gallery_collection_albums.collection_id = ? AND
                   refinery_photo_gallery_photos.album_id  = refinery_photo_gallery_albums.id AND
                   refinery_photo_gallery_photos.preview_image = true
                    ", collection_id).
            order('created_at DESC, title ASC')
      }
=end


      def collection_ids
        Refinery::PhotoGallery::CollectionAlbum.select('collection_id').where("album_id = ?", self.id ).map{|ca| ca.collection_id }
      end


=begin # Prety url. Problems with :id
      def to_param
        "#{id}-#{title.parameterize}"
      end
=end
      def set_path
        #Replaces special characters in tile

         if self.path_prefix.blank?  &&  self.path.blank?
          self.path =  self.title.parameterize
        elsif self.path.present? && self.title.present?
          # dont't update path, when album has photos and we change title
        else
          self.path = [self.path_prefix, self.title.parameterize].join('-')
        end

      end
    end
  end
end
