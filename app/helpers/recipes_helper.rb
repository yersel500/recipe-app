module RecipesHelper
  def public?(recipe)
    recipe.public
  end

  def calulate_price(recipe)
    foods = recipe.foods
    recipe_foods = recipe.recipe_foods
    price = 0

    foods.each do |food|
      price += recipe_foods.find_by(food_id: food.id).quantity * food.price
    end
    price
  end
end
