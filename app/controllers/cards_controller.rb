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
    @counter = @business.reward_mechanism.counter
    if @card.points < @counter
      @card.points += 1
    else
      @card.points = 0
    end
    @card.save
    redirect_to my_customers_business_path(@card.business)
  end

  def new
    @business = Business.find(params[:business_id])
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @business = Business.find(params[:business_id])
    @card.business = @business
    @card.points = 0
    if @card.save
      redirect_to businesses_path
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:user_id)
  end
end
