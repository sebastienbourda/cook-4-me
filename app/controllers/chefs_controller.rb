class ChefsController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(chef_params)
    @user.chef = true
    if @user.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chef_params
    params.require(:user).permit(:chef_comment, :radius)
  end
end
