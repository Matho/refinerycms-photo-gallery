# Self-marking required fields http://davidsulc.com/blog/2011/05/01/self-marking-required-fields-in-rails-3/
# It works, but I'm leaving it commented. It affects all forms in refinery app, not only in this gem
=begin

class ActionView::Helpers::FormBuilder
  alias :orig_label :label

# add a '*' after the field label if the field is required
  def label(method, content_or_options = nil, options = nil, &block)
    if content_or_options && content_or_options.class == Hash
      options = content_or_options
    else
      content = content_or_options
    end

    required_mark = ''
    required_mark = ' *'.html_safe if object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator

    content ||= I18n.t("activerecord.attributes.#{object.class.name.underscore}.#{method}", :default=>method.to_s.humanize)
    content = content + required_mark

    self.orig_label(method, content, options || {}, &block)
  end
end

=end