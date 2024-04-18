module Turbo
  class SpreadsheetsController < ApplicationController
    include Rails.application.routes.url_helpers
    before_action :authenticate_user!

    expose :raw_posts, -> { Post.approved.kept }
    expose :posts, -> { PostQuery.new(query_params, raw_posts).all }

    expose :exels, ->  { current_user.exels.order(created_at: :desc) }

    # rubocop:disable Metrics/AbcSize
    def create
      file_data = Post.to_xlsx(instances: posts.to_a, spreadsheet_columns: lambda { |instance|
        data = [
          ["Заголовок", instance.title],
          ["Дата создания", instance.created_at],
          ["Дата утверждения", instance.approved_at || "Создано администратором"],
          ["Ссылка на пост", post_url(instance.id)],
          ["Вложение", "Ссылки на вложения, если они есть:"]
        ]

        instance.content.body.attachables.each do |attachment|
          data.push ["Вложение", rails_blob_url(attachment)]
        end

        data
      })

      time = Time.zone.now.strftime("%d-%m-%Y_%H:%M:%S")
      name = "#{SecureRandom.uuid}_#{time}"

      exel = Exel.new(user: current_user, label: "#{time}.xlsx")
      exel.file.attach(io: StringIO.new(file_data), filename: "#{name}.xlsx")

      if exel.save
        flash[:notice] = "created!"

        render :create
      else
        flash[:alert] = "error"

        render :new
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def query_params
      params.require(:query).permit(:author, :region, :date).to_h
    end
  end
end
