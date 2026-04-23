require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it "全ての情報があれば保存できる" do
    expect(@comment).to be_valid
  end

  it "textが空だと保存できない" do
    @comment.text = ""
    @comment.valid?
    expect(@comment.errors.of_kind?(:text, :blank)).to be true
  end
end