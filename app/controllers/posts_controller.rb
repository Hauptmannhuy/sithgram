class PostsController < ApplicationController
  def index
    @posts = current_user.relative_posts
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    result = PublishPost.call(params: permitted_params, user: current_user)
    if result.success?
      redirect_to posts_path
    else
      @post = result.post
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    DeletePost.call(id: params[:id])
    redirect_to posts_path
  end

  private

  def permitted_params
    params.require(:post).permit(:body,:image)
  end

end
