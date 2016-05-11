class PostsController < ApplicationController
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
     post_params = params.require( :post ).permit( :message )

     @post = Post.new( message: post_params[:message] )
     @post.user = current_user

     if @post.save
        redirect_to posts_path
     else
        render posts_path
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
end
