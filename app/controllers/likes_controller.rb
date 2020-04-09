# Likes controller
class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, chirp_id: params[:chirp_id])

    if @like.save
      redirect_back(fallback_location: root_path,
                    notice: 'You liked that chirp!')
    else
      redirect_back(fallback_location: root_path,
                    alert: 'You can not like that chirp.')
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user,
                        chirp_id: params[:chirp_id])
    if like
      like.destroy
      redirect_back(fallback_location: root_path, notice: 'You disliked
                                                           that chirp')
    else
      redirect_back(fallback_location: root_path,
                    alert: 'You cannot dislike chirp that you did
                            not like before.')
    end
  end
end
