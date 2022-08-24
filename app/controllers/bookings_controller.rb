class BookingsController < ApplicationController
  before_action :set_offer

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_booking_path(@offer, @booking)
    else
      render "offers/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comments, :number_of_guests)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
