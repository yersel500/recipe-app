class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  def show
    @user = User.find(params[:user_id])
    @foods = @user.foods
    @food = @foods.find(params[:id])
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    user = current_user
    @food = Food.new(food_params)
    @food.user = user

    if @food.save
      flash[:notice] = 'Food saved successfully'
      redirect_to user_foods_path(user_id: @food.user_id)
    else
      render :new, alert: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to user_foods_path, status: :see_other
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
