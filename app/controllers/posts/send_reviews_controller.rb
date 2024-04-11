module Posts
  class SendReviewsController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: SendReviewPolicy
    end
  end
end
