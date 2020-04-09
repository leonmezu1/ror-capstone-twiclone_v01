# Following helper
module FollowingsHelper
  def follow_btn(user, cls = nil)
    return unless current_user != user

    if current_user.following?(user)
      link_to(unfollow_path(user_id: user.id),
              class: 'follow-btn', method: :delete) do
        content_tag(:i, '', class: "fas fa-minus-circle #{cls}").html_safe
      end
    else
      link_to(follow_path(user_id: user.id),
              class: 'follow-btn', method: :post) do
        content_tag(:i, '', class: "fas fa-plus-circle #{cls}").html_safe
      end
    end
  end
end
