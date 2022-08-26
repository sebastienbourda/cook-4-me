class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @offers = Offer.where(user: current_user).all
    @meals = Meal.where(user: current_user).all
    if current_user.chef
      @bookings = []
      @offers.each do |offer|
        offer.bookings.each do |booking|
          @bookings << booking
        end
      end
    else
      @bookings = Booking.where(user: current_user).all
    end
    @reviews = Review.all
  end
end
