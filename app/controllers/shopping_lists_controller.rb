class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.where(user: current_user.id)
    #@foods = current_user.foods
    @markets = Market.all
        # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
        @markers = @markets.geocoded.map do |market|
          {
            lat: market.latitude,
            lng: market.longitude
          }
        end
  end

  def create
    puts params
    @user = current_user
    @food = Food.find(params[:food_id])
    if @food.shopping_lists.where(user: current_user.id)!=[]
      @food.shopping_lists.where(user: current_user.id).destroy_all
    else
      @shopping_list = ShoppingList.new
      @shopping_list.user = @user
      @shopping_list.food = @food
      @shopping_list.save 
    end
    redirect_to foods_path
  end

  def destroy
    puts params
    ShoppingList.find(params[:id]).destroy
    redirect_to shopping_lists_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:id)
  end
end
