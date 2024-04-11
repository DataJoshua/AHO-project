class RegionsController < ApplicationController
  before_action :authenticate_user!

  expose :regions, -> { Region.all }
  expose :region

  def index; end

  def show; end
end
