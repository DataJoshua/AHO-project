class PostsController < ApplicationController
  before_action :authenticate_user!

  expose :post
  expose :region, -> { Region.find(params[:region_id]) }
  expose :posts, -> { region.posts }

  def index; end

  def new; end

  def edit; end

  def create
    if create_post.success?
      flash[:notice] = "Post created"
      redirect_to region_path(region)
    else
      flash[:alert] = create_post.errors

      render :new, status: :unprocessable_entity
    end
  end

  def update
    if update_post.success?
      flash[:notice] = "Post updated"

      redirect_to region_path(region)
    else
      flash[:alert] = update_post.errors

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post.destroy

    redirect_to region_path(region)
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
