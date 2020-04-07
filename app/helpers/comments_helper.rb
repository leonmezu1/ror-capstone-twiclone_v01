# frozen_string_literal: true

# Useful methods
module CommentsHelper
  def user_nick(comment)
    link_to((symbol_nick comment.user).to_s, user_path(comment.user))
  end

  def comment_trash(comment)
    if current_user.id == comment.user.id
      link_to(uncomment_path(comment, id: comment.id), method: :delete) do
        content_tag(:i, '', class: 'far fa-trash-alt').html_safe
      end
    end
  end
end
