class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    puts params
    @shopping_list = ShoppingList.create(shopping_list_params)
  end

  def destroy
    puts params
    ShoppingList.find(params[:shopping_list]).destroy
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:id)
  end
end
