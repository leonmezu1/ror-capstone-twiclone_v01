# frozen_string_literal: true

# User helper
module UsersHelper
  # rubocop: disable Metrics/AbcSize
  # rubocop: disable Metrics/MethodLength
  def gravatar_for(user, size = 80, cls = nil)
    if user.avatar.attached?
      formated = user.avatar.variant(resize: "#{size}x#{size}!")
      link_to(user_path(user)) do
        image_tag(formated, alt: user.username, class: "gravatar rounded-lg
         #{cls}")
      end
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      grav_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      link_to(user_path(user)) do
        image_tag(grav_url, alt: user.username, class: "gravatar rounded-lg
         #{cls}")
      end
    end
  end

  def gravatar_circled_for(user, size = 80, cls = nil)
    if user.avatar.attached?
      formated = user.avatar.variant(resize: "#{size}x#{size}!")
      link_to(user_path(user)) do
        image_tag(formated, alt: user.username, class: "gravatar rounded-circle
                                                        #{cls}")
      end
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      grav_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      link_to(user_path(user)) do
        image_tag(grav_url, alt: user.username, class: "gravatar rounded-circle
                                                        #{cls}")
      end
    end
  end

  def cover_for(user, sizex = 100, sizey = 100, cls = nil)
    if user.cover.attached?
      cover_img = user.cover.variant(resize: "#{sizex}x#{sizey}!")
      image_tag(cover_img, alt: 'cover image', class: "cover-me #{cls}")
    else
      image_tag("https://picsum.photos/#{sizex}/#{sizey}/",
                alt: 'cover_image', class: cls.to_s)
    end
  end
  # rubocop: enable Metrics/AbcSize
  # rubocop: enable Metrics/MethodLength

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
