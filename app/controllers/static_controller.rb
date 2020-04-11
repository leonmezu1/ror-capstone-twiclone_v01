# Static controller
class StaticController < ApplicationController
  def feature; end

  def help; end

  def next; end

  def next_update
    current_user.update_attributes(permited)
    redirect_to root_path, notice: 'Welcome'
  end

  private

  def permited
    params.require(:user).permit(:avatar, :bio, :cover)
  end
end
