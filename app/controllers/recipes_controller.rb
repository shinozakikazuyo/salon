class RecipesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def index
    @recipes = Recipe.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @image = @recipe.image
  end
  
end
