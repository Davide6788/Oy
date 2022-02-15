class MessageroomsController < ApplicationController
  def show
    @messageroom = Messageroom.find(params[:id])
    @message = Message.new
  end
end
