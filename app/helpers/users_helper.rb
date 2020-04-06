# frozen_string_literal: true

# User helper
module UsersHelper
  def gravatar_for(user, size = 80)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar rounded')
  end

  def symbol_nick(user)
    '@' + user.username
  end
end
