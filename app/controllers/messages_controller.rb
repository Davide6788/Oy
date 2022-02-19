class MessagesController < ApplicationController
  def create
    @messageroom = Messageroom.find(params[:messageroom_id])
    @message = Message.new(message_params)
    @message.messageroom = @messageroom
    @message.user = current_user
    if @message.save
      MessageroomChannel.broadcast_to(
        @messageroom,
        render_to_string(partial: "message", locals: { message: @message, current_user: nil })
      )
      redirect_to messageroom_path(@messageroom, anchor: "message-#{@message.id}")
    else
      render "messagerooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
