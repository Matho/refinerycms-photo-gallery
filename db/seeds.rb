if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_photo_gallery').blank?
      user.plugins.create(:name => 'refinerycms_photo_gallery',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Refinery::Page) and !Refinery::Page.exists?(:link_url => '/photo-gallery')
  page = Refinery::Page.create(
      :title => "Photo galleries",
      :link_url => "/photo-gallery",
      :deletable => false,
      :menu_match => "^/photo-gallery?(\/|\/.+?|)$"
  )

  Refinery::Pages.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end