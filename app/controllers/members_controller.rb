class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @members = Member.all
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      current_user.members << @member
      redirect_to @member
    else
      render action: 'new'
    end
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to @member 
    else
      render action: 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url 
  end

  private

  def set_member
  @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :user_id, :xingredlist, :age, :gender, :allergy_ids => [], :diet_ids => [])
  end

end