# frozen_string_literal: true

# Like helper
module LikesHelper
  # rubocop: disable Lint/UselessAssignment:
  def like_or_dislike_btn(chirp)
    like = Like.find_by(chirp: chirp, user: current_user)

    link_to(chirp_like_path(id: like.id, chirp_id: chirp.id),
            class: 'btn btn-sm outline-primary mt-3', method: :delete) do
      content_tag(:i, '', class: 'fas fa-heart-broken').html_safe
    end
  rescue StandardError
    link_to(chirp_likes_path(chirp_id: chirp.id),
            class: 'btn btn-sm outline-primary mt-3', method: :post) do
      content_tag(:i, '', class: 'fas fa-heart').html_safe
    end
  end
  # rubocop: enable Lint/UselessAssignment:

  def likes_count(chirp)
    "#{chirp.likes.count} #{'like'.pluralize(chirp.likes.count)}"
  end
end
