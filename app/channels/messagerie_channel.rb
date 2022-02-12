class MessagerieChannel < ApplicationCable::Channel
  def subscribed
    messagerie = Messagerie.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
