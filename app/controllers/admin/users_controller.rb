class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
  
end
