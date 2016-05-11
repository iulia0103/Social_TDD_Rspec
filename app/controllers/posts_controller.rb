class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
     post_params = params.require( :post ).permit( :message )

     @post = Post.new( message: post_params[:message] )

     if @post.save
        redirect_to posts_path
     else
        render posts_path
     end
  end
end
