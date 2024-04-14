module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_user!

    expose :posts_under_review, -> { Post.under_review.includes(:user).kept }

    expose :raw_posts, -> { current_user.posts.kept }
    expose :pagy_posts, -> { pagy(raw_posts, items: 6) }
    expose :posts, -> { pagy_posts.last }

    def show; end
  end
end
