class BusinessesController < ApplicationController
  def index
    @businesses = Business.where.not(latitude: nil, longitude: nil)
    @markers = @businesses.map do |business|
      {
        lat: business.latitude,
        lng: business.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { business: business }),
        image_url: helpers.asset_path("logo-menu.svg")

      }
    end
  end

  def show
    @business = Business.find(params[:id])
    @reward_mechanism = RewardMechanism.find_by(business_id: @business.id)
    @user = current_user
    @card = Card.find_by(business_id: @business.id, user_id: @user.id) if user_signed_in?
  end

  def my_businesses
    @businesses = Business.where(user_id: current_user)
  end

  def my_customers
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to new_business_reward_mechanism_path(@business)
    else
      render :new
    end
  end

  def destroy
    @business = Business.find(params[:id])
    authorize @business
    @business.destroy
  end

  def update
    @business = Business.find(params[:id])
    authorize @business
    @business.update(params[:business])
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :category_id, :photo, :description, :host_names)
  end
end
