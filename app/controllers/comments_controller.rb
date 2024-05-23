class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create!(permitted_params)
    redirect_to posts_path
  end

  def destroy

  end

  def permitted_params
    params.require(:comment).permit(:body,:user_id)
  end
end
