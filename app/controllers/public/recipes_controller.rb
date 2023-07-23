class Public::RecipesController < ApplicationController

  def index
    @genres = Genre.all
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.genre_name = Genre.find(params[:recipe][:genre_id]).genre_name
    @recipe.save!
    
    #先ほど新規登録したrecipeの詳細ページにリダイレクト
    redirect_to recipe_path(@recipe.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @recipes = @user.recipe
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    #先ほど編集したrecipeの詳細ページにリダイレクト
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def favorites
    user = current_user
    @favorites = user.favorites
  end

  private
  # ストロングパラメータ
  def recipe_params
    params.require(:recipe).permit(:image, :name, :introduction, :price, :id, :serving, :cooking_time, :genre_id, :genre_name, :ingredient, :recipe, :point, :recipe_name)
  end

end
