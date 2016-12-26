require "spec_helper"

describe "manage album items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no album items" do
    it "invites to create one" do
      #save_and_open_page

      visit refinery.photo_gallery_admin_albums_path
      expect(page).to have_content("There are no albums yet. Click \"Create new album\" to add your first album.")
    end
  end

  describe "submenu links" do
    it "should have submenu links" do
      visit refinery.photo_gallery_admin_albums_path

      within "#actions" do
        expect(page).to have_content("Collections")
        expect(page).to have_content("Manage")
      end
    end
  end

  describe "action links" do
    it "shows create new album" do
      visit refinery.photo_gallery_admin_albums_path

      within "#actions" do
        expect(page).to have_content("Create new album")
        expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/photo-gallery/albums/new']")
      end
    end

    it "shows create new collection" do
      visit refinery.photo_gallery_admin_albums_path

      within "#actions" do
        expect(page).to have_content("Create new collection")
        expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/photo-gallery/collections/new']")
      end
    end
  end

  describe "new/create" do
    it "allows to create albums" do
      visit refinery.photo_gallery_admin_albums_path

      click_link "Create new album"

      fill_in "Title", :with => "My first album"
      fill_in "Path prefix", :with => "16_04"
      fill_in "Description", :with => "This is long story description ... "
      click_button "Save"

      expect(page).to have_content("'My first album' was successfully added.")

      expect(Refinery::PhotoGallery::Album.count).to eq(1)
    end
  end

  describe "edit/update" do
    before { FactoryGirl.create(:album, :title => "Update me") }

    it "updates album" do
      visit refinery.photo_gallery_admin_albums_path

      expect(page).to have_content("Update me")

      click_link "Edit this album"

      fill_in "Title", :with => "Updated"
      click_button "Save"

      expect(page).to have_content("'Updated' was successfully updated.")
    end
  end

  describe "destroy" do
    before { FactoryGirl.create(:album, :title => "Delete me") }

    it "removes album" do
      visit refinery.photo_gallery_admin_albums_path

      click_link "Remove this album forever"

      expect(page).to have_content("'Delete me' was successfully removed.")

      expect(Refinery::PhotoGallery::Album.count).to eq(0)
    end
  end
end