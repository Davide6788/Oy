class MessageroomsController < ApplicationController
  def index
    @messagerooms = Messageroom.where(user_id: current_user)
  end

  def show
    @messageroom = Messageroom.find(params[:id])
    @message = Message.new
  end

  def create
    @business = Business.find(params[:business_id])
    @messageroom = Messageroom.new
    @messageroom.user_id = current_user.id
    @messageroom.business_id = @business.id
    if @messageroom.save
      redirect_to messageroom_path(@messageroom)
    else
      render :new
    end
  end
end
