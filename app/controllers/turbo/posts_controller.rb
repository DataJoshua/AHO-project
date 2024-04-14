module Turbo
  class PostsController < ApplicationController
    include Rails.application.routes.url_helpers

    expose :raw_posts, -> { Post.approved.kept }
    expose :filtered_posts, -> { PostQuery.new(query_params, raw_posts).all }
    expose :pagy_posts, -> { pagy(filtered_posts, items: 6, anchor_string: "data-turbo-stream='true'") }

    expose :posts, -> { pagy_posts.last }

    def index; end

    private

    def query_params
      params.require(:query).permit(:author, :region, :date).to_h
    end
  end
end
