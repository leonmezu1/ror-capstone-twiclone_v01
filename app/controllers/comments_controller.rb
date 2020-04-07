# frozen_string_literal: true

# Comments controller
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.chirp_id = params[:chirp_id]
    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment posted')
    else
      redirect_back(fallback_location: root_path,
                    alert: @comment.errors.full_messages.join('. ').to_s)
    end
  end

  def destroy
    if params[:id]
      Comment.find(params[:id]).destroy
      redirect_back(fallback_location: root_path, alert: 'Comment deleted')
    else
      redirect_back(fallback_location: root_path, alert: 'Oops! something went wrong')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :comment_id, :id)
  end
end
