class ContentsController < ApplicationController
  before_action :set_group
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @content = Content.new
    @contents = @group.contents.includes(:user)
    @articles = Content.order(created_at: :desc).limit(3)
  end

  def new
    @content = Content.new
    @contents = @group.contents.includes(:user)
  end

  def create
    @content = @group.contents.new(content_params)
    if @content.save
      redirect_to group_contents_path(@group), notice: '保存できました'
    else
      @contents = @group.contents.includes(:user)
      flash.now[:alert] = '内容を入力してください'
      render :index
    end
  end

  def show
  end

  def destroy
    if @content.destroy
      redirect_to group_mypages_path
    else
      render :show
    end
  end

  private

  def content_params
    params.require(:content).permit(:text, :title, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
    @users = @group.users
    @user = current_user
  end

  def set_content
    @content = Content.find(params[:id])
  end
  
end
