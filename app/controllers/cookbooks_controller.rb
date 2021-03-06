class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @cookbooks = Cookbook.all
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      current_user.cookbooks << @cookbook
      redirect_to members_url
    else
      render action: 'new'
    end
  end

  def new
    @cookbook = Cookbook.new
  end

  def edit
  end

  def update
    if @cookbook.update(cookbook_params)
      redirect_to @cookbook 
    else
      render action: 'edit'
    end
  end

  def destroy
    long_lost_recipes = current_user.cookbooks.where(name: "Long Lost Recipes")
    if long_lost_recipes != []
      @cookbook.recipes.each do |recipe|
        current_user.cookbooks.where(name: "Long Lost Recipes").first.recipes << recipe
      end
    else
      current_user.cookbooks << Cookbook.new(name: "Long Lost Recipes")
      @cookbook.recipes.each do |recipe|
        current_user.cookbooks.where(name: "Long Lost Recipes").first.recipes << recipe
      end
    end
    @cookbook.destroy
    redirect_to members_url 
  end

  private

  def set_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :user_id, :id, recipes: [])
  end

end