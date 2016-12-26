FactoryGirl.define do
  factory :album, class: Refinery::PhotoGallery::Album do
    title { Faker::Lorem::word }
    path "15_04"
    description "describtion about album"
    address "slovakia"
  end
end