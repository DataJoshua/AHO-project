module Admin
  class RegistrationsController < ApplicationController
    before_action :authenticate_user!
    expose :user

    def create
      if create_user.success?
        flash[:notice] = "Admin Created"
      else
        flash[:alert] = create_user.errors
      end

      redirect_to dashboard_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def create_user
      @create_user ||= Admins::Create.call(user_params:)
    end
  end
end
