module Turbo
  class PostsController < ApplicationController
    expose :raw_posts, -> { Post.kept }
    expose :posts, -> { PostQuery.new(query_params, raw_posts).all }

    def index; end

    private

    def query_params
      params.require(:query).permit(:author, :region).to_h
    end
  end
end
