# frozen_string_literal: true

# User helper
module UsersHelper
  def gravatar_for(user, size = 80)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar rounded-lg')
  end

  def gravatar_circled_for(user, size = 80, cls = nil)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username,
                            class: "gravatar rounded-circle #{cls}")
  end

  def symbol_nick(user)
    '@' + user.username
  end

  def username_link(user)
    link_to(symbol_nick(user), user_path(user), class: 'u_name')
  end

  def fullname_link(user)
    link_to(user.full_name, user_path(user), class: 'f_name')
  end
end
