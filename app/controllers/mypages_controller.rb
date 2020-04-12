class MypagesController < ApplicationController
  before_action :set_group

  def index
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
    @users = @group.users
    @user = current_user
  end
end
