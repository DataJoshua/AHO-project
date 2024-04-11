module Regions
  class PostsController < ApplicationController
    include Authorization
    before_action :authenticate_user!

    expose :post
    expose :region, -> { Region.find(params[:region_id]) }

    def new
      authorize! region, with: PostPolicy
    end

    def edit
      authorize! post
    end

    def create
      authorize! region, with: PostPolicy

      if create_post.success?
        flash[:notice] = "Post created"
        redirect_to region_path(region)
      else
        flash[:alert] = create_post.errors

        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize! post

      if update_post.success?
        flash[:notice] = "Post updated"

        redirect_to post_path(post)
      else
        flash[:alert] = update_post.errors

        render :edit, status: :unprocessable_entity
      end
    end

    private

    def create_post
      @create_post ||= Posts::Create.call(user: current_user, post_params:, region:)
    end

    def update_post
      @update_post ||= Posts::Update.call(post_params:, post:)
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
end
