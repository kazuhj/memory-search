class UsersController < ApplicationController
  before_action :set_user
  before_action :set_group

  def show
    @group = Group.find_by(params[:group_id])
    @users = @group.users
    @content = Content.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @group = Group.find_by(params[:group_id])
    if current_user.update(user_params)
      redirect_to group_mypages_path(@group)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :text)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_group
    @group = Group.find_by(params[:group_id])
  end

end