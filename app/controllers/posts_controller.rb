# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :not_logged_in?, only: [:index]
  # before_create :logged_in?, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Your post has been created!'
      render :root
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :body, :title)
  end
end
