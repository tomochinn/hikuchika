class Public::RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    # 検索する場合
    if params[:search].present?
      @recipes = Recipe.search_by_title(params[:search])

    # レシピ一覧を表示する場合
    else
      @genres = Genre.all
      @genre = Genre.where(id: params[:genre_id])
      @recipes = Recipe.all

    end
  end

  def search
    @genres = Genre.all
    @recipes = Recipe.where(genre_id: params[:genre_id])
    render "index"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.genre_id = params[:recipe][:genre_id]

    if @recipe.save
      #先ほど新規登録したrecipeの詳細ページにリダイレクト
      flash[:notice] = "レシピの投稿に成功しました。"
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
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
