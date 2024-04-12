module Admins
  class Create
    class PrepareParams
      include Interactor

      delegate :user_params, to: :context

      def call
        user = User.new(user_params)
        user.admin_created = true
        context.user = user
      end
    end
  end
end
