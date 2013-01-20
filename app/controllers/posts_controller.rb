class PostsController < ApplicationController
  def index
    @posts = Post.order("posted_at DESC").limit(15)
  end
end
