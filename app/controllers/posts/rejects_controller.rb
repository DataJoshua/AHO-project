module Posts
  class RejectsController < ApplicationController
    include Authorization
    expose :post

    def create
      authorize! post, with: RejectPolicy

      begin
        RejectPostJob.perform_async(post.id)
        flash[:notice] = "success"
      rescue => e
        flash[:alert] = e
      end

      redirect_to dashboard_path
    end
  end
end
