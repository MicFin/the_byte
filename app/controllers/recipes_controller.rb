class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      current_user.recipes << @recipe
      redirect_to @recipe
    else
      render action: 'show' #new
    end
  end

  def create_from_search
    @recipe = Recipe.new(name: params[:name], rating: params[:rating])
    if @recipe.save
      current_user.recipes << @recipe
      redirect_to @show
    else
      render action: 'new'
    end
  end

  # def new
  #   @recipe = Recipe.new
  # end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe 
    else
      render action: 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to cookbooks_url 
  end


  private

  def set_recipe
  @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :link, :ingredient_list, :rating, :note, :order_ids => [])
  end

end