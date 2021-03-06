class CardsController < ApplicationController
  def index
    if params[:order] == 'desc'
      @cards = Card.where(user_id: current_user).order(points: :desc)
    else
      @cards = Card.where(user_id: current_user)
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def add_point
    @card = Card.find(params[:id])
    @business = @card.business
    @reward_mechanism = RewardMechanism.find_by(business_id: @card.business_id)
    @counter = @business.reward_mechanism.counter
    if @card.points < @counter
      @card.points += 1
    else
      @card.points = 0
    end
    @user = @card.user
    if @card.save
      UserChannel.broadcast_to(
        @user,
        render_to_string(partial: "stamps", locals: { user: @user, card: @card, reward_mechanism: @reward_mechanism })
      )
      redirect_to my_customers_business_path(@card.business)
    end
  end

  # def reward_alert
  #   @card = Card.find(params[:id])
  #   @business = @card.business
  #   @reward_mechanism = RewardMechanism.find_by(business_id: @card.business_id)
  #   @counter = @business.reward_mechanism.counter

  #   if @card.points == @counter
  #     redirect_to business_path, notice: "Congrats ! You've reached your reward : #{@reward_mechanism.discount}"
  #   end
  # end

  def new
    @business = Business.find(params[:business_id])
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @business = Business.find(params[:business_id])
    @reward_mechanism = RewardMechanism.find_by(business_id: params[:business_id])
    @card.business = @business
    @card.points = 0
    if @card.save
      UserChannel.broadcast_to(
        @card.user,
        render_to_string(partial: "stamps", locals: { user: @user, card: @card, reward_mechanism: @reward_mechanism })

      )
      redirect_to my_customers_business_path(@card.business)
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:user_id)
  end
end
