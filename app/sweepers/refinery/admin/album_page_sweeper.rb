# This is not traditional sweeper, this is only class called in pages_extension.rb , because I was unable to
# append this sweeper in Admin::PagesController.

module Refinery
  module Admin
    class AlbumPageSweeper

      def self.sweep
        ActionController::Base.new.expire_fragment( 'refinery/recent_album_page')
      end

    end
  end
end
