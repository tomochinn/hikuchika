class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def top
    @users = User.all
  end
  
  private
  # ストロングパラメータ
  def top_params
    params.require(:top).permit(:created_at, :id, :name)
  end
  
end
