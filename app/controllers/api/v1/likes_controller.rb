class Api::V1::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_or_initialize_by(post_id: @post.id)
    if @like.save
      render json: { message: 'Post liked' }
    else
      render json: { error: 'Unable to like the post' }, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id]) 
    if @like
      @like.destroy
      render json: { message: 'Like removed' }
    else
      render json: { error: 'No like found' }, status: :not_found
    end
  end
end

