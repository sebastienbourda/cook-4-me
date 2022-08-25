class OffersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params.except(:meal_ids).merge(user: current_user))
    if @offer.save
      meals = offer_params[:meal_ids]
      meals.delete_at(0)
      meals.each do |meal_id|
        offer_meal = OfferMeal.new
        offer_meal.meal_id = meal_id.to_i
        offer_meal.offer = @offer
        offer_meal.save
      end
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    if @offer.save?
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :category, :price_per_person, :photo, meal_ids: [])
  end

  def find_id
    @offer = Offer.find(params[:id])
  end
end
