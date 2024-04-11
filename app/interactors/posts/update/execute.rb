module Posts
  class Update
    class Execute
      include Interactor

      delegate :post, :post_params, to: :context

      def call
        content.fail!(errors: post_errors) unless post.update(post_params)
      end

      private

      def post_errors
        post.errors.full_messages.join(", ")
      end
    end
  end
end
