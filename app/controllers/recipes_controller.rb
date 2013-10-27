class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @recipes = Recipe.all
  end

  def create
    if @recipe.save
      # current_user.recipes << @recipe
      redirect_to @recipe
    else
      render action: 'new' #new
    end
  end

  def create_from_search
    @recipe = Recipe.new(name: params[:name], rating: params[:rating], image: params[:image], ingredient_list: params[:ingredient_list], link: params[:link], time: params[:time])
    if @recipe.save
      if current_user.cookbooks.count < 1
        current_user.cookbooks << Cookbook.new(name: "Recently Added")
        Cookbook.find(:first).recipes << @recipe 
      else
        Cookbook.find(:first).recipes << @recipe 
      end
binding.pry
      redirect_to @recipe
    else
      render action: 'new'
    end

    # if params[:cookbook_id] != nil
    #   @recipe = Recipe.new(name: params[:name], rating: params[:rating], image: params[:image], ingredient_list: params[:ingredient_list], link: params[:link], time: params[:time], cookbook_id: params[:cookbook_id], note: params[:note])
    #   if @recipe.save
    #     redirect to @recipe 
    #   else
    #     render action: 'new'
    #   end
    # else
    #   @recipe = Recipe.new(name: params[:name], rating: params[:rating], image: params[:image], ingredient_list: params[:ingredient_list], link: params[:link], time: params[:time])
    #   render action: 'new'
    # end
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
    @recipe.destroy
    redirect_to cookbooks_url 
  end


  private

  def set_recipe
  @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :image, :link, :time, :ingredient_list, :rating, :note, :order_id)
  end

end