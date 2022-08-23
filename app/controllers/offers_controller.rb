class OffersController < ApplicationController
  def index
  end

  def show
    @offer = Offer.find(params[:id])
    @user = current_user
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
