# frozen_string_literal: true

# Controller
class ChirpsController < ApplicationController
  def index
    timeline_chirps
    @suggested_users = current_user.follow_suggest
  end

  def create
    @post = current_user.chirps.new(chirp_params)

    if @post.save
      redirect_to chirps_path, notice: 'Chirp sent'
    else
      redirect_to chirps_path, alert: 'Oops! something went wrong'
    end
  end

  def destroy
    if params[:id]
      Chirp.find(params[:id]).destroy
      redirect_back(fallback_location: root_path, alert: 'Chirp deleted')
    else
      redirect_back(fallback_location: root_path,
                    alert: 'Oops! something went wrong')
    end
  end

  private

  def timeline_chirps
    @timeline_chirps ||= current_user.user_timeline
  end

  def chirp_params
    params.require(:chirp).permit(:content, :id)
  end
end
