class CommentsController < ApplicationController
  def create
    result = PostComment.call(post_id: params[:post_id], params: permitted_params)
    if result.success?
      respond_to do |format|
        @post = result.post
        @comment = result.comment
        format.turbo_stream
      end
    else
      if !result.error.nil?
        redirect_to posts_path, notice: result.error
      else
        redirect_to posts_path
      end
    end
  end

  def destroy

  end

  def permitted_params
    params.require(:comment).permit(:body,:user_id)
  end
end
