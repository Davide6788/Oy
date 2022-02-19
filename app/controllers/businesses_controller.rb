class BusinessesController < ApplicationController
  def index
    @businesses = Business.where.not(latitude: nil, longitude: nil)
    @user = current_user
    @cards = Card.where(user_id: @user)
    @markers = @businesses.map do |business|
      if @cards.include?(Card.find_by(business_id: business.id))
        @card = Card.find_by(business_id: business.id)
        @card_points = @card.points
        @card_total = business.reward_mechanism.counter
      end
      {
        lat: business.latitude,
        lng: business.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { business: business }),
        image_url: helpers.asset_path("logo-menu.svg"),
        card_nil: @card.nil?,
        card_points: @card_points,
        card_total: @card_total
      }
    end
  end

  def show
    @business = Business.find(params[:id])
    # authorize @business
    @reward_mechanism = RewardMechanism.find_by(business_id: @business.id)
    @user = current_user
    @card = Card.find_by(business_id: @business.id, user_id: @user.id) if user_signed_in?
    @chatroom = Chatroom.find(2)

    {
      reward_mechanism: @reward_mechanism
    }
  end

  def my_businesses
    @businesses = Business.where(user_id: current_user)
    # authorize @business
  end

  def my_customers
    @business = Business.find(params[:id])
    # authorize @business
  end

  def new
    @business = Business.new
    # authorize @business
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    # authorize @business
    if @business.save
      redirect_to new_business_reward_mechanism_path(@business)
    else
      render :new
    end
  end

  def destroy
    @business = Business.find(params[:id])
    # authorize @business
    @business.destroy
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    # authorize @business
    if @business.update(business_params)
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :category_id, :photo, :description, :host_names)
  end
end
