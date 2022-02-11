class RewardMechanismsController < ApplicationController


  def new
    @business = Business.find(params[:business_id])
    @reward_mechanism = RewardMechanism.new
    authorize @reward_mechanism
  end

  def create
    @reward_mechanism = RewardMechanism.new(reward_mechanism_params)
    @business = Business.find(params[:business_id])
    @reward_mechanism.business = @business
    authorize @reward_mechanism
    if @reward_mechanism.save
      redirect_to businesses_path
    else
      render :new
    end
  end

  private

  def reward_mechanism_params
    params.require(:reward_mechanism).permit(:counter, :discount, :minimum_purchase)
  end
end
