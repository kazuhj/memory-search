require 'rails_helper'

#テストする場合はgroups_controllerの
#「before_action :authenticate_user!」をコメントアウトする。

describe ContentsController, type: :controller  do
  let(:user) { create(:user) }

  describe 'Get #index' do
    it "投稿内容がトップページに表示されるか" do
      group = create(:group)
      get :index, params: { group_id: group.id }
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      group = create(:group)
      get :new, params: { group_id: group.id }
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "【投稿詳細表示】インスタンス変数の値が期待したものになるか" do
      content = create(:content)
      get :show, params: { id: content.id, group_id: content.group_id } 
      expect(assigns(:content)).to eq content
    end
    it "詳細ページへ遷移するか" do
      content = create(:content)
      get :show, params: { id: content.id, group_id: content.group_id } 
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "【投稿編集】インスタンス変数の値が期待したものになるか" do
      content = create(:content)
      get :edit, params: { id: content.id, group_id: content.group_id } 
      expect(assigns(:content)).to eq content
    end
    it "編集ページへ遷移するか" do
      content = create(:content)
      get :edit, params: { id: content.id, group_id: content.group_id } 
      expect(response).to render_template :edit
    end
  end

  describe 'GET #destroy' do
    it "【投稿削除】インスタンス変数の値が期待したものになるか" do
      content = create(:content)
      delete :destroy, params: { id: content.id, group_id: content.group_id } 
      expect(assigns(:content)).to eq content
    end
  end
end