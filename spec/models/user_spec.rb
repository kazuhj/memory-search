require 'rails_helper'

describe User do
  describe '#create' do

    # 1
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it "nameがない場合は登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4
    it "passwordがない場合は登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6
    it "nameが10文字以上であれば登録できない" do
      user = build(:user, name: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は10文字以内で入力してください")
    end

    # 7
    it "nameが9文字以下では登録できる" do
      user = build(:user, name: "aaaaaaaaa")
      expect(user).to be_valid
    end

    # 8
    it "重複したemailが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 9
    it "passwordが6文字以上であれば登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10
    it "passwordが5文字以下であれば登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end