# Controller
class UsersController < ApplicationController
  def show
    @user = User.find(userparams[:id])
    @user_chirps = @user.chirps.most_recents
  end

  protected

  def userparams
    params.permit(:id)
  end
end
