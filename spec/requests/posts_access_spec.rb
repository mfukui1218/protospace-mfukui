require 'rails_helper'

RSpec.describe "Posts access control", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post_record) { FactoryBot.create(:post, user: user) }

  describe "未ログイン時のアクセス制御" do
    it "新規投稿ページに行くとログインページにリダイレクトされる" do
      get new_post_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "編集ページに行くとログインページにリダイレクトされる" do
      get edit_post_path(post_record)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
