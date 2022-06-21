class RecipesController < ApplicationController
  def index
    # @recipes = Recipe.includes(:recipe_foods).where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @foods = Food.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:notice] = 'The recipe is deleted!'
      redirect_to user_recipes_path(user_id: params[:user_id])
    else
      flash[:alert] = 'Unable to delete the recipe.'
      render user_recipe_path(@recipe)
    end
  end
end
