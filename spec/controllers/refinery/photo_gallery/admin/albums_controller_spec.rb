require "spec_helper"

module Refinery
  module PhotoGallery
    module Admin
      describe AlbumsController, type: :controller do
        refinery_login_with_devise [:refinery, :superuser]

        before do
          logged_in_user.plugins = logged_in_user.plugins | %w(refinerycms_photo_gallery)
        end

        describe "#index" do
          it "succeeds" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
          end
        end
=begin
        describe "#index" do
          let!(:album) { FactoryGirl.create(:album) }

          it "succeeds" do
            get :index

            img_path = "#{Rails.root.join("tmp/capybara")}/screenshot2.png"
            page.save_screenshot(img_path)
            Launchy.open img_path

            expect(response).to be_success
            expect(response).to render_template(:index)
          end
        end
=end
      end
    end
  end
end
