class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.last
    Cookbook.find((params["recipe"]["cookbook_id"]).to_i).recipes << @recipe

      redirect_to @recipe

  end

  def create_from_search
    if current_user.cookbooks.count == 0
      current_user.cookbooks << Cookbook.new(name: "Temporary Cookbook")
      binding.pry
    end
    @recipe = Recipe.new(name: params[:name], rating: params[:rating], image: params[:image], ingredient_list: params[:ingredient_list], link: params[:link], time: params[:time], note: params[:note])
    if @recipe.save
      render action: 'new'
    else
      render action: 'new'
    end
  end

  def new
    @recipe = @recipe
  end

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
    if @recipe.cookbook == current_user.cookbooks.where(name: "Long Lost Recipes").first  
      @recipe.destroy  
    else
      if current_user.cookbooks.where(name: "Long Lost Recipes").count >= 1
        @recipe.update(cookbook_id: current_user.cookbooks.where(name: "Long Lost Recipes").first.id)
        @recipe.save
        current_user.cookbooks.where(name: "Long Lost Recipes").first.recipes << @recipe
        current_user.cookbooks.where(name: "Long Lost Recipes").first.save
      else
        current_user.cookbooks << Cookbook.new(name: "Long Lost Recipes")
        @recipe.update(cookbook_id: current_user.cookbooks.last.id)
        @recipe.save
        current_user.cookbooks.last.recipes << @recipe
        current_user.cookbooks.last.save
        current_user.save
      end
    end
    redirect_to members_url 
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :link, :time, :ingredient_list, :rating, :note, :cookbook_id)
  end

end