module Authorization
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :deny_access!
  end

  private

  def deny_access!
    flash[:alert] = "You are not authorized!"

    redirect_to root_path
  end
end
