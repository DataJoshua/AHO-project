module Admins
  class Create
    class Execute
      include Interactor

      delegate :user, to: :context

      def call
        context.fail!(errors: user_errors) unless user.save

        user.add_role :admin
      end

      private

      def user_errors
        user.errors.full_messages.join(", ")
      end
    end
  end
end
