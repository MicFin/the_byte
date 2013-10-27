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
    end
    @recipe = Recipe.new(name: params[:name], rating: params[:rating], image: params[:image], ingredient_list: params[:ingredient_list], link: params[:link], time: params[:time], note: params[:note])
    if @recipe.save
    #   if current_user.cookbooks.count < 1
    #     current_user.cookbooks << Cookbook.new(name: "Recently Added")
    #     Cookbook.find(:first).recipes << @recipe 
    #   else
    #     Cookbook.find(:first).recipes << @recipe 
    #   end
# binding.pry
#       redirect_to @recipe
      render action: 'new'
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
    params.require(:recipe).permit(:name, :image, :link, :time, :ingredient_list, :rating, :note, :cookbook_id)
  end

end