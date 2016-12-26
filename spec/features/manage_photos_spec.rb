require "spec_helper"

describe "manage photo items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser


  describe "edit/update" do
    before do
      FactoryGirl.create(:album_with_photos, :title => "Album name")
    end

    it "updates photo" do
      visit refinery.photo_gallery_admin_albums_path

      expect(page).to have_content("Album name")

      click_link "Edit photos in album"

      fill_in "photos_photo_5_title", :with => "Updated title 5"
      fill_in "photos_photo_4_title", :with => "Updated title 4"
      fill_in "photos_photo_3_title", :with => "Updated title 3"
      fill_in "photos_photo_2_title", :with => "Updated title 2"
      fill_in "photos_photo_1_title", :with => "Updated title 1"
      click_button "Save"

      expect(page).to have_content("Updated photos")
    end
  end

  describe "destroy" do
    before do
      FactoryGirl.create(:album_with_photos, :title => "Album name")
    end

    it "removes photo" do
      visit refinery.photo_gallery_admin_albums_path

      expect(page).to have_content("Album name")

      click_link "Edit photos in album"

      first(:link, "Remove").click

      expect(Refinery::PhotoGallery::Photo.count).to eq(4)
    end
  end
end