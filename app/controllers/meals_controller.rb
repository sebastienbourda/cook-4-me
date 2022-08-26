class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update destroy]

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
    @meal.update(params_meal)
    if @meal.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def params_meal
    params.require(:meal).permit(:name, :category, :ingredients, :photo)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
