class PostsController < ApplicationController
  include Authorization
  before_action -> { authorize! post }
  expose :posts, -> { Post.approved.includes(:region, :rich_text_content, user: %i[roles]).kept }
  expose :post

  def index; end

  def show; end
end
