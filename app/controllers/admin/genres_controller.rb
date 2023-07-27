class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @genre = Genre.new
  end

  def create
    # 新しいジャンルを登録する箱を用意する
    @genre = Genre.new(genre_params)
    @genres = Genre.all

    if @genre.save
      flash[:notice] = "ジャンルの作成に成功しました。"
    # genre一覧にリダイレクト
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:genre_name, :genre, :recipe_id)
  end

end