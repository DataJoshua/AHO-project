class PostsController < ApplicationController
  expose :posts, -> { Post.includes(:region, :rich_text_content, user: %i[roles]).kept }
  expose :post

  def index; end

  def show; end
end
