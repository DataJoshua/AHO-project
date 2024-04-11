module Posts
  class Create
    class PrepareParams
      include Interactor

      delegate :user, :region, :post, :post_params, to: :context

      def call
        context.post = Post.new(post_params.merge(post_params_additional_params))
      end

      private

      def post_params_additional_params
        {
          user:,
          region:
        }
      end
    end
  end
end
