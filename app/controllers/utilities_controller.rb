class UtilitiesController < ApplicationController
  def delete_food
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food was deleted successfully'
      redirect_to user_foods_path(user_id: params[:user_id])
    else
      flash[:alert] = 'Unable to delete'
    end
  end
end
