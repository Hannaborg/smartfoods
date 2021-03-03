class FavoriteRecipesController < ApplicationController
  def index
    @user = current_user
    @favorite_recipes = FavoriteRecipe.all
  end

  def create
    @favorite_recipe.user = current_user
    @favorite_recipe = FavoriteRecipe.new(favorite_params)
    if @favorite_recipe.save
      flash[:success] = "Recipe successfully saved"
      redirect_to food_recipes_path
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

  private

  def favorite_params
    params.require(:favorite_recipe).permit(:recipe_id, :user_id)
  end
end
