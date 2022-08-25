class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(params_meal)
    @meal.user = current_user
    if @meal.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_meal
    params.require(:meal).permit(:name, :category, :ingredients)
  end
end
