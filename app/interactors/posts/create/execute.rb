module Posts
  class Create
    class Execute
      include Interactor

      delegate :post, to: :context

      def call
        context.fail!(errors: post_errors) unless post.save
      end

      private

      def post_errors
        post.errors.full_messages.join(", ")
      end
    end
  end
end
