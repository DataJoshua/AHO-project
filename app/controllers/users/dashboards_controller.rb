module Users
  class DashboardsController < ApplicationController
    before_action :authenticate_user!
    expose :posts, -> { current_user.posts.kept }

    def show; end
  end
end
