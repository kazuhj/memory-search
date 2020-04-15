require 'rails_helper'

describe Content do
  describe '#create' do
    it "titleが空では登録登録できない" do
      content = build(:content, title: "")
      content.valid?
      expect(content.errors[:title]).to include("を入力してください")
    end

    it "titleが40文字以上であれば登録できない" do
      content = build(:content, name: "aaaaaaaaaaiiiiiiiiiiuuuuuuuuuueeeeeeeeeeoo")
      content.valid?
      expect(content.errors[:title]).to include("は40文字以内で入力してください")
    end

    it "textが空では登録できない" do
      content = build(:content, text: nil)
      content.valid?
      expect(content.errors[:text]).to include("を入力してください")
    end

    it "imageが空では登録できない" do
      content = build(:content, image: nil)
      content.valid?
      expect(content.errors[:image]).to include("を入力してください")
    end

    it "title,text,imageが存在しないと登録できない" do
      content = build(:content)
      expect(content).to be_valid
    end
  end
end

