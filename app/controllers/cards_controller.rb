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

end
