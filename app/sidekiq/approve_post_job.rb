class ApprovePostJob
  include Sidekiq::Job

  def perform(post_id)
    post = Post.find_by(id: post_id)

    post.update(state: :approved,
                approved_at: Time.now.in_time_zone)
  end
end
