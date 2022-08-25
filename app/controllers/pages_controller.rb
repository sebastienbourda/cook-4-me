class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @offers = Offer.where(user: current_user).all
    @meals = Meal.where(user: current_user).all
    @bookings = Booking.where(user: current_user).all
    @reviews = Review.all
  end
end
