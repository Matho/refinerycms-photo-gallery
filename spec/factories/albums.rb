FactoryBot.define do
  factory :album, class: ::Refinery::PhotoGallery::Album do
    title { Faker::Lorem::word }
    path "15_04"
    description "describtion about album"
    address "slovakia"

    factory :album_with_photos do
      transient do
        photos_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |album, evaluator|
        create_list(:photo, evaluator.photos_count, album: album)
      end

    end
  end
end
