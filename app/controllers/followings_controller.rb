# following controller
class FollowingsController < ApplicationController
  def create
    user_to_follow = User.find(params[:user_id])

    following = Following.new(user: user_to_follow, follower: current_user)
    if following.save
      redirect_back(fallback_location: root_path,
                    notice: "You are following @#{user_to_follow.username}")
    else
      redirect_back(fallback_location: root_path,
                    alert: 'Oops! something went wrong!')
    end
  end

  def destroy
    user_to_follow = User.find(params[:user_id])
    following = Following.find_by(user_id: user_to_follow.id,
                                  follower_id: current_user.id)
    if following
      following.destroy
      redirect_back(fallback_location: root_path, notice: "You wont't see
                                     @#{user_to_follow.username} chirps")
    else
      redirect_back(fallback_location: root_path,
                    alert: 'Oops! something went wrong!')
    end
  end
end
