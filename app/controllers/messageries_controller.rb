class MessageriesController < ApplicationController
  def show
    @messagerie = Messagerie.find(params[:id])
    @message = Message.new
  end

  def create
    @messagerie = messagerie.find(params[:id])
    @message = Message.new(message_params)
    @message.messagerie = @messagerie
    @message.user = current_user
    raise
    if @message.save
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
