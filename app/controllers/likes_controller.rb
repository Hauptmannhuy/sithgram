class LikesController < ApplicationController
  def add
    Like.create(permitted_params)
    @post = Post.find(permitted_params[:post_id])
    @likes = @post.likes.count
    respond_to do |format|
    format.turbo_stream
    end
  end

  def remove
    Like.where(permitted_params).destroy_all
    @post = Post.find(permitted_params[:post_id])
    @likes = @post.likes.count
    respond_to do |format|
      format.turbo_stream
      end
  end
  private
  def permitted_params
    params.require('like').permit(:post_id,:user_id)
  end
end
