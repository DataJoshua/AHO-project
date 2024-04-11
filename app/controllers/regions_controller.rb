class RegionsController < ApplicationController
  expose :regions, -> { Region.all }
  expose :region

  def index; end

  def show; end
end
