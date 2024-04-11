module Posts
  class SendReviewsController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: SendReviewPolicy

      begin
        SendToReviewJob.perform_async(post.id)
        flash[:notice] = "success"
      rescue => e
        flash[:alert] = e
      end

      redirect_to dashboard_path
    end
  end
end
