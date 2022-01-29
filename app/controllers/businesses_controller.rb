class BusinessesController < ApplicationController
  def new
    @business = Business.find(params[:id])
  end


  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
  end

  def update
    @business = Business.find(params[:id])
    @business.update(params[:business])
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :category)
  end
end


## 
