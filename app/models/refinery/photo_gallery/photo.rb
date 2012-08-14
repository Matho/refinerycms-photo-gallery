module Refinery
  module PhotoGallery
    class Photo < ActiveRecord::Base
      belongs_to :album

      mount_uploader :file, Refinery::PhotoGallery::Admin::FileUploader
      acts_as_indexed :fields => [:title, :description]
      attr_accessible :album_id, :title, :description, :longitude, :latitude
      validates :title, :presence => true
      #TODO validate latitude/longitude - convert from nondecimal to decimal using inspiration from https://github.com/airblade/geo_tools/tree/master/lib/geo_tools

      before_validation :set_title
      before_create :exif_read
      #before_update :exif_write #TODO or use it after update?
      #TODO delete photo path from db? is it used?

      self.per_page = Refinery::PhotoGallery.photos_per_page

      def to_param
        "#{id}-#{title.parameterize}"
      end

      private

      def set_title
        self.title = self.file.file.basename.titleize unless self.title
      end

      def exif_read
        begin
          photo = MiniExiftool.new(self.file.file.file, {:numerical=> true})

          self.longitude = photo.GPSLongitude if self.longitude.nil?
          self.latitude = photo.GPSLatitude if self.latitude.nil?
          self.title = photo.DocumentName if photo.DocumentName.present?
          self.description = photo.ImageDescription if self.description.nil? && photo.ImageDescription != 'Exif_JPEG_PICTURE'
            # TODO read keywords from exif
        rescue
          p "ERROR raised exception during MiniExiftool reading"
        ensure
          self.description = "" if self.description.nil?  # Because description is concating in helpers, this can't be null
        end
      end


=begin
      #TODO add checkbox to check if it should be writed to exif, globally on/off writing
      def exif_write
        # should only write if tags are changed as images can be large and thus ExifTool will take a while to write to the file
        photo = MiniExiftool.new(self.file.file.file)
        photo.GPSLongitude = self.longitude
        photo.GPSLatitude = self.latitude
        photo.DocumentName = self.title
        photo.ImageDescription = self.description
        photo.Keywords = self.tags
        photo.save
      end
=end

    end
  end
end

