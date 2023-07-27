class Public::UsersController < ApplicationController
  
  def index
    @user = current_user
    @recipes = @user.recipes
  end
  
  def show
    @user = current_user
    @user.get_image(200,200)
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    @user.update(user_params)
    redirect_to user_path
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
  
end
