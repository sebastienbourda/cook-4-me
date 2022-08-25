class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
  end

  def create
    # @offer_meal = OfferMeal.new
    # @offer = Offer.new(title:            offer_params[:title],
    #                    category:         offer_params[:category],
    #                    price_per_person: offer_params[:price_per_person],
    #                    user:             current_user)
    @offer = Offer.new(offer_params.except(:meal_ids).merge(user: current_user))
    # @offer << offer_params[5]
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
    offer = Offer.find(params[:id])
    offer.update(offer_params)
    if offer.save?
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :category, :price_per_person, :photo, meal_ids: [])
  end
end
