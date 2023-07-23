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

    # 新しいジャンルを保存する
    @genre.save
    
    # genre一覧にリダイレクト
    redirect_to admin_genres_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:genre_name, :genre, :recipe_id)
  end

end