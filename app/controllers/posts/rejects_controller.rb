module Posts
  class RejectsController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: RejectPolicy
    end
  end
end
