require 'rails_helper'

RSpec.describe "Post authorization", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:post_record) { FactoryBot.create(:post, user: other_user) }

  describe "ログイン中でも他人の投稿は編集できない" do
    before do
      sign_in user
      get edit_post_path(post_record)
    end

    it "トップページにリダイレクトされる" do
      expect(response).to redirect_to(root_path)
    end
  end
end