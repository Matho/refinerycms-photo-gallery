require "spec_helper"

describe "manage collection items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no collection items" do
    it "invites to create one" do
      #save_and_open_page

      visit refinery.photo_gallery_admin_collections_path
      expect(page).to have_content("There are no collections yet. Click \"Create new collection\" to add your first collection.")
    end
  end


  describe "new/create" do
    it "allows to create collections" do
      visit refinery.photo_gallery_admin_collections_path

      click_link "Create new collection"

      fill_in "Title", :with => "My first collection"
      fill_in "Description", :with => "My collection description ..."
      click_button "Save"

      expect(page).to have_content("'My first collection' was successfully added.")

      expect(Refinery::PhotoGallery::Collection.count).to eq(1)
    end
  end

  describe "edit/update" do
    before { FactoryGirl.create(:collection, :title => "Update me") }

    it "updates collection" do
      visit refinery.photo_gallery_admin_collections_path

      expect(page).to have_content("Update me")

      click_link "Edit this collection"

      fill_in "Title", :with => "Updated"
      click_button "Save"

      expect(page).to have_content("'Updated' was successfully updated.")
    end
  end

  describe "destroy" do
    before { FactoryGirl.create(:collection, :title => "Delete me") }

    it "removes collection" do
      visit refinery.photo_gallery_admin_collections_path

      click_link "Remove this collection forever"

      expect(page).to have_content("'Delete me' was successfully removed.")

      expect(Refinery::PhotoGallery::Collection.count).to eq(0)
    end
  end
end