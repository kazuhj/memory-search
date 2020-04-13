class MypagesController < ApplicationController
  before_action :set_group

  def index
    @contents = Content.where(user_id: current_user.id).order("id DESC").limit(5)
    @content = Content.where(user_id: current_user.id)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
    @users = @group.users
    @user = current_user
  end
end
