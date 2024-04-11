module Posts
  class ApprovesController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: ApprovePolicy

      begin
        ApprovePostJob.perform_async(post.id)
        flash[:notice] = "success"
      rescue => e
        flash[:alert] = e
      end

      redirect_to dashboard_path
    end
  end
end
