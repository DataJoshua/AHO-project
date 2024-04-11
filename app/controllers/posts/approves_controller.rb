module Posts
  class ApprovesController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: ApprovePolicy
    end
  end
end
