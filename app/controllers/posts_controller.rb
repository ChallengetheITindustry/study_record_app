class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_path

    def index
      @posts = Post.order(id: :asc)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to post
  end

  def edit
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:date, :title, :content)
  end

end
