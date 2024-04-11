module Admin
  class DashboardsController < ApplicationController
    before_action :authenticate_user!
    expose :under_review_posts, -> { Post.under_review.kept }

    def show; end
  end
end
