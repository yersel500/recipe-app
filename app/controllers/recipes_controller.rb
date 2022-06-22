class RecipesController < ApplicationController
  def index
    # @recipes = Recipe.includes(:recipe_foods).where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def shopping_list
    @recipes = User.find(params[:user_id]).recipes
    @foods = Food.all
    # @recipe_foods = @recipe.recipe_foods
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to user_recipes_path(user_id: params[:user_id])
    else
      flash[:alert] = "Couldn't create the recipe!"
      render :new
    end
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

  def public_recipes
    @public_recipes = Recipe.includes(:user, [:foods], :recipe_foods).where(public: true)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description,
                                   :public)
  end
end
