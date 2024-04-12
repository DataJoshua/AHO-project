module Turbo
  class SpreadsheetsController < ApplicationController
    include Rails.application.routes.url_helpers
    before_action :authenticate_user!

    expose :raw_posts, -> { Post.approved.kept }
    expose :posts, -> { PostQuery.new(query_params, raw_posts).all }

    expose :exels, -> { current_user.exels }

    def create
      file_data = Post.to_xlsx(instances: posts.to_a, spreadsheet_columns: lambda { |instance|
        [
          :title,
          :created_at,
          :updated_at,
          ["Approved_at", instance.approved_at || "Created by Admin"],
          ["URL", post_url(instance.id)]
        ]
      })

      name = "#{SecureRandom.uuid}_#{Time.zone.now}"

      exel = Exel.new(user: current_user, label: "#{Time.zone.now}.xlsx")
      exel.file.attach(io: StringIO.new(file_data), filename: "#{name}.xlsx")

      if exel.save
        flash[:notice] = "created!"

        render :create
      else
        flash[:alert] = "error"

        render :new
      end
    end

    private

    def query_params
      params.require(:query).permit(:author, :region, :date).to_h
    end
  end
end
