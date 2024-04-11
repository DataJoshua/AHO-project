module Posts
  class Destroy
    class Execute
      include Interactor

      delegate :post, to: :context

      def call
        context.fail!(errors: "Post has not been deleted") unless post.discard
      end
    end
  end
end
