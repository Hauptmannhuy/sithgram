class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
   @comment = @post.comments.create!(permitted_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy

  end

  def permitted_params
    params.require(:comment).permit(:body,:user_id)
  end
end
