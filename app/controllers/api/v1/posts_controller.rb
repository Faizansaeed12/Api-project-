class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user! 
  
  def create
    @post = current_user.posts.build(post_params) 
    if @post.save
    render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post  
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end  
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.soft_delete
    render json: {message: 'Post deleted'}  
  end

  private
  def post_params
    params.require(:post).permit(:content, :image_type, :deleted_at)
  end

end
