module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_user!

    expose :posts_under_review, -> { Post.under_review.includes(:user).kept }
    expose :posts, -> { current_user.posts.kept }

    def show; end
  end
end
