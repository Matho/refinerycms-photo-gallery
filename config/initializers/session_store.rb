#Rails.application.config.session_store :cookie_store, :key => '_balder_session'

=begin
#TODO fix flash runtime
Rails.application.config.middleware.insert_before(
    Rails.application.config.session_store,
    Refinery::PhotoGallery::Admin::FlashSessionCookieMiddleware,
    Rails.application.config.session_options[:key]
)
=end