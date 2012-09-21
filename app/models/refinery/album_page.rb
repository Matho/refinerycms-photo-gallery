module Refinery
    class AlbumPage < Refinery::Core::BaseModel

      belongs_to  :album , :class_name => Refinery::PhotoGallery::Album
      belongs_to :page, :polymorphic => true


      attr_accessible :page_id, :page_type, :album_id

    end
end
