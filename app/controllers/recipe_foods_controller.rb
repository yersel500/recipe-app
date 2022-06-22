class RecipeFoodsController < ApplicationController
  def show
    @recipe_food = RecipeFood.find(params[:id])
  end

  def new
    @user = current_user
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to user_recipe_path(user_id: params[:user_id], id: @recipe_food.recipe_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
