class RejectPostJob
  include Sidekiq::Job

  def perform(post_id)
    post = Post.find_by(id: post_id)

    post.update(state: :rejected)
  end
end
