class RegionsController < ApplicationController
  before_action :authenticate_user!

  expose :region
  expose :regions, -> { Region.all }
  expose :posts, -> { region.posts.kept }

  def index; end

  def show; end
end
