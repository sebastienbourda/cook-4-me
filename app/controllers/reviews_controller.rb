class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @offer = Offer.find(params[:offer_id])
    @review.booking = @booking
    if @review.save
      redirect_to offer_booking_path(@booking, @offer)
    else
      render "bookings/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :photo)
  end
end
