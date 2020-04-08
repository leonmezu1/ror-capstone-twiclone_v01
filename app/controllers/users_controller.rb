# frozen_string_literal: true

# Controller
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_chirps = @user.chirps.most_recents
  end
end
