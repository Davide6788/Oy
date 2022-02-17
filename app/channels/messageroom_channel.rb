class MessageroomChannel < ApplicationCable::Channel
  def subscribed
    messageroom = Messageroom.find(params[:id])
    stream_for messageroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
