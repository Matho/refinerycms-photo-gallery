FactoryBot.define do
  factory :collection, class: ::Refinery::PhotoGallery::Collection do
    title { Faker::Lorem::word }
    description "collection description"
  end
end
