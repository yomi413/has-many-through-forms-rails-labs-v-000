class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @user = @post.users.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
