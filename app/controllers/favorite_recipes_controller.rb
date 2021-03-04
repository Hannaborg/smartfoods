class FavoriteRecipesController < ApplicationController
  def index
    @user = current_user
    @favorite_recipes = FavoriteRecipe.all
  end

  def show 
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite_recipe = FavoriteRecipe.new()
    @favorite_recipe.recipe = @recipe
    @favorite_recipe.user = current_user
    if @favorite_recipe.save
      flash[:success] = "Recipe successfully saved"
      redirect_to favorite_recipes_path
    else
      flash[:error] = "Something went wrong"
      redirect_to food_recipe_path
    end
  end

  def destroy
    @favorite_recipe = FavoriteRecipe.find(params[:id])
    if @favorite_recipe.destroy
      flash[:notice] = 'Saved recipe entry was successfully deleted.'
      redirect_to favorite_recipes_path
    else
      flash[:alert] = 'Something went wrong'
      redirect_to favorite_recipe_path
    end
  end

end
