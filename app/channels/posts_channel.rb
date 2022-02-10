class PostsChannel < ApplicationCable::Channel
  def subscribed
    posts = Posts.find(params[:id])
    stream_for posts
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
