class MessageroomsController < ApplicationController
  def index
    @messagerooms = Messageroom.where(user_id: current_user)
  end

  def show
    @messageroom = Messageroom.find(params[:id])
    @message = Message.new
  end

  def create
    if Messageroom.find_by(user_id: current_user.id, business_id: params[:business_id]).nil?
      @business = Business.find(params[:business_id])
      @messageroom = Messageroom.new
      @messageroom.user_id = current_user.id
      @messageroom.business_id = @business.id
      if @messageroom.save
        redirect_to messageroom_path(@messageroom)
      else
        render :new
      end
    else
      @messageroom = Messageroom.find_by(user_id: current_user.id, business_id: params[:business_id])
      redirect_to messageroom_path(@messageroom)
    end
  end
end
