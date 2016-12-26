FactoryGirl.define do
  factory :photo, class: Refinery::PhotoGallery::Photo do
    #sequence(:title){|n| "Photo-#{n}" }
    #file  { Rack::Test::UploadedFile.new( File.open(File.join(File.join(Refinery.roots(:'refinery/photo_gallery'), 'spec', 'support', 'images', 'refinery-logo-trans.png'))), "image/png" ) }
  end
end


