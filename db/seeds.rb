if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_photo_gallery').blank?
      user.plugins.create(:name => 'refinerycms_photo_gallery',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

