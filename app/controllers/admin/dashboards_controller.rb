module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_user!

    expose :posts_under_review, -> { Post.under_review.includes(:rich_text_content, :user).kept }
    expose :posts, -> { current_user.posts.includes(:rich_text_content).kept }

    def show; end
  end
end
