require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post_record) { FactoryBot.create(:post) }

  describe "コメント投稿" do
    context "ログインしている場合" do
      before do
        sign_in user
      end

      it "正しい情報を入力するとコメントが投稿できる" do
        expect {
          post post_comments_path(post_record),
               params: { comment: { text: "テストコメント" } }
        }.to change(Comment, :count).by(1)
      end

      it "空のコメントだと投稿できず、詳細ページに留まる" do
        expect {
          post post_comments_path(post_record),
               params: { comment: { text: "" } }
        }.not_to change(Comment, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end