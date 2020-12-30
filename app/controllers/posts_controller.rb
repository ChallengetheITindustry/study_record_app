class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy edit update]
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
    redirect_to posts_path, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @posts = Post.order(id: :asc)
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, alert: "削除しました"
  end

  def show
    @posts = Post.where(id: params[:id])
  end

  def edit
  end

  def update
    @post.update!(post_params)
    if @post.update(post_params)
    redirect_to posts_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
