class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
   @comment = @post.comments.new(permitted_params)
    if @comment.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      redirect_to posts_path
    end
  end

  def destroy

  end

  def permitted_params
    params.require(:comment).permit(:body,:user_id)
  end
end
