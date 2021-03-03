class RecipesController < ApplicationController
  def index
    @food = Food.find(params[:food_id])
    @recipes = @food.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
