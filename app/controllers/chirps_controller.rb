# frozen_string_literal: true

# Controller
class ChirpsController < ApplicationController
  def index
    @chirp = Chirp.new
    timeline_chirps
  end

  def create
    @post = current_user.chirps.new(chirp_params)

    if @post.save
      redirect_to chirps_path, notice: 'Chirp sent'
    else
      timeline_chirps
      render :index, alert: 'Oops! something went wrong'
    end
  end

  private

  def timeline_chirps
    @timeline_chirps ||= current_user.user_timeline
  end

  def post_params
    params.require(:chirp).permit(:content)
  end
end
