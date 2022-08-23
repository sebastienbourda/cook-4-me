class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @chef = @offer.user
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
