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

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to user_recipe_path
  end
end
