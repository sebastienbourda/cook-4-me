class BookingsController < ApplicationController
  before_action :set_offer, except: [:accept, :reject]

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    @total_price = @booking.number_of_guests * @offer.price_per_person.to_i
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

  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: 1)
    @booking.save

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json
    end
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: 2)
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comments, :number_of_guests)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
