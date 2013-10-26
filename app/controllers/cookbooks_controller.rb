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
      redirect_to @cookbook
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
    @cookbook.destroy
    redirect_to cookbooks_url 
  end


  private

  def set_cookbook
  @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :user_id, :recipes => [])
  end

end