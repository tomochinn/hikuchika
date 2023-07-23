class Public::FavoritesController < ApplicationController
  
  def index
    @user = current_user
    recipe_id = params[:recipe_id]
    @recipe = Recipe.find(recipe_id)
    # ユーザーが保存したレシピを探し@favorite_recipesに格納
    @favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @favorite_recipes = Recipe.find(@favorites)
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: recipe.id)
    
    favorite.save
    
    redirect_to recipe_path(recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    
    redirect_to recipe_path(params[:recipe_id])
  end
  
  private
  # ストロングパラメータ
  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
  
end
