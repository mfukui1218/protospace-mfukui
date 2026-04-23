require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context "新規登録できる場合" do
    it "全ての情報が揃っていれば登録できる" do
      expect(@user).to be_valid
    end
  end

  context "新規登録できない場合" do
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.of_kind?(:email, :blank)).to be true
    end

    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.of_kind?(:email, :taken)).to be true
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.of_kind?(:password, :blank)).to be true
    end

    it "passwordが6文字未満だと登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.of_kind?(:password, :too_short)).to be true
    end

    it "passwordとpassword_confirmationが不一致だと登録できない" do
      @user.password_confirmation = "different"
      @user.valid?
      expect(@user.errors.of_kind?(:password_confirmation, :confirmation)).to be true
    end

    it "usernameが空だと登録できない" do
      @user.username = ""
      @user.valid?
      expect(@user.errors.of_kind?(:username, :blank)).to be true
    end

    it "profileが空だと登録できない" do
      @user.profile = ""
      @user.valid?
      expect(@user.errors.of_kind?(:profile, :blank)).to be true
    end

    it "affiliationが空だと登録できない" do
      @user.affiliation = ""
      @user.valid?
      expect(@user.errors.of_kind?(:affiliation, :blank)).to be true
    end

    it "positionが空だと登録できない" do
      @user.position = ""
      @user.valid?
      expect(@user.errors.of_kind?(:position, :blank)).to be true
    end
  end
end