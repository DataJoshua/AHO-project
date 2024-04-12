module Turbo
  class PostsController < ApplicationController
    include Rails.application.routes.url_helpers

    expose :raw_posts, -> { Post.approved.kept }
    expose :posts, -> { PostQuery.new(query_params, raw_posts).all }

    def index; end

    private

    def query_params
      params.require(:query).permit(:author, :region, :date).to_h
    end
  end
end
