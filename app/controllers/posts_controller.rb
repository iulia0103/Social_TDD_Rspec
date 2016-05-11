class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      redirect_to new_post_path, alert: "Something went wrong please try again"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find( params[:id] )

    post_params = params.require( :post ).permit( :message )

    if @post.update_attributes( post_params )
      redirect_to @post
   else
      render 'edit'
   end
 end

  def destroy
    @post = Post.find( params[:id] )

    @post.destroy

    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
