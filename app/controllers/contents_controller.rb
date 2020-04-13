class ContentsController < ApplicationController
  before_action :set_group
  before_action :set_content, only: [:show, :edit, :update, :destroy, :edit, :update]

  def index
    @contents = @group.contents.includes(:user,:tags).order(updated_at: :desc)
    @articles = @group.contents.includes(:user,:tags).order(updated_at: :desc).limit(3)
  end

  def new
    @content = Content.new
    @contents = @group.contents.includes(:user)
  end

  def create
    @content = @group.contents.new(content_params)
    @content.user_id = current_user.id 
    if @content.save
      redirect_to group_contents_path(@group), notice: '保存できました'
    else
      @content.images.new
      @contents = @group.contents.includes(:user)
      flash.now[:alert] = '内容を入力してください'
      render :new
    end
  end

  def show
  end

  def destroy
    if @content.destroy
      redirect_to group_mypages_path, notice: '削除できました'
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @content.update(update_content_params)
      redirect_to group_contents_path(@group), notice: '変更できました'
    else
      render :edit
    end
  end

  def search
    @contents = @group.contents.includes(:user, :tags)
    @posts = Content.search(params[:search])
    if params[:tag_name]
      @posts = Content.tagged_with("#{params[:tag_name]}")
    end
  end

  private

  def content_params
    params.require(:content).permit(:text, :title, :image, :tag_list).merge(user_id: current_user.id)
  end

  def update_content_params
    params.require(:content).permit(:text, :title, :image, :tag_list).merge(user_id: current_user.id)
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
