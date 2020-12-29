class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy edit update]
  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_path
  end

  def index
    @posts = Post.order(id: :asc)
  end

  def destroy
    @post.destroy!
    redirect_to post
  end

  def show
    @posts = Post.where(id: params[:id])
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:date, :title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
