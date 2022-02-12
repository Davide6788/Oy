class MessagesController < ApplicationController

  def create
    @messagerie = messagerie.find(params[:id])
    @message = Message.new(message_params)
    @message.messagerie = @messagerie
    @message.user = current_user
    if @message.save
      MessagerieChannel.broadcast_to(
        @messagerie,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to messagerie_path(@messagerie, anchor: "message-#{@message.id}")
    else
      render "messageries/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
