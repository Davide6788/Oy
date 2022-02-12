class MessageriesController < ApplicationController
  def show
    @messagerie = Messagerie.find(params[:id])
    @message = Message.new
  end
end
