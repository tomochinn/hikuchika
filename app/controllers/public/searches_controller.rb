class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    
    @range = params[:range]

    # if @range == "User"
    #   @users = User.looks(params[:search], params[:word])
    # else
    #   @recipes = Recipe.looks(params[:search], params[:word])
    # end
    
    @recipes = Recipe.looks(params[:search], params[:word])
    @genres = Genre.all
  end
  
end
