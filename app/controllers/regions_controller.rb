class RegionsController < ApplicationController
  before_action :authenticate_user!

  expose :region
  expose :regions_pagy, -> { pagy(Region.all) }
  expose :regions, -> { regions_pagy.last }
  expose :region_posts, -> { region.posts.approved.kept }

  def index; end

  def show; end
end
