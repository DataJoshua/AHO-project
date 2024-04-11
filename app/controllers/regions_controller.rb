class RegionsController < ApplicationController
  before_action :authenticate_user!

  expose :region
  expose :regions, -> { Region.all }
  expose :region_posts, -> { region.posts.approved.kept }

  def index; end

  def show; end
end
