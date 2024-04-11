class SendToReviewJob
  include Sidekiq::Job

  def perform(post_id)
    post = Post.find_by(id: post_id)

    post.update(state: :under_review)
  end
end
