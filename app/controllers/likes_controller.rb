class LikesController < ApplicationController
  def create
    @like = Like.create(permitted_params)
    @likes = Post.find(permitted_params[:post_id]).likes.count
    
    respond_to do |format|
    format.turbo_stream { render turbo_stream: turbo_stream.update('count', @likes) }
    end
  end

  def destroy

  end
  private
  def permitted_params
    params.require('like').permit(:post_id,:user_id)
  end
end
