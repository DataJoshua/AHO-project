class PostsController < ApplicationController
  include Authorization
  before_action :authenticate_user!
  before_action -> { authorize! post }

  expose :raw_posts, -> { Post.approved.includes(:region, user: %i[roles]).kept }
  expose :pagy_posts, -> { pagy(raw_posts) }
  expose :posts, -> { pagy_posts.last }

  expose :post
  expose :exels, -> { current_user.exels }

  def index; end

  def show; end

  def destroy
    if destroy_post.success?
      flash[:notice] = "Post deleted succesfully"
    else
      flash[:alert] = destroy_post.errors
    end

    redirect_to dashboard_path
  end

  private

  def destroy_post
    @destroy_post ||= Posts::Destroy.call(post:)
  end
end
