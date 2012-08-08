Refinery::Core.configure do |config|
  # Register extra javascript for backend
  config.register_javascript  "refinery/photo_gallery/admin/photo_gallery.js"
  config.register_javascript "refinery/photo_gallery/admin/jquery.chosen.min.js"

  #Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/photo_gallery/admin/photo_gallery.css"
  config.register_stylesheet "refinery/photo_gallery/admin/chosen.css"

end