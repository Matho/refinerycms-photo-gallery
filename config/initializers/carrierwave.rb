
CarrierWave.configure do |config|
  config.root = Rails.root.to_s + Refinery::PhotoGallery.photo_gallery_dir_relative_to_root
  #Prefix in Uploader#url See https://github.com/jnicklas/carrierwave/pull/445
  config.base_path = Refinery::PhotoGallery.photo_gallery_dir
end

