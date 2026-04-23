require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  it "全ての情報があれば保存できる" do
    expect(@post).to be_valid
  end

  it "imageが空だと保存できない" do
    @post.image.detach
    @post.valid?
    expect(@post.errors.of_kind?(:image, :blank)).to be true  
  end

  it "titleが空だと保存できない" do
    @post.title = ""
    @post.valid?
    expect(@post.errors.of_kind?(:title, :blank)).to be true
  end

  it "catchcopyが空だと保存できない" do
    @post.catchcopy = ""
    @post.valid?
    expect(@post.errors.of_kind?(:catchcopy, :blank)).to be true
  end

  it "contentが空だと保存できない" do
    @post.content = ""
    @post.valid?
    expect(@post.errors.of_kind?(:content, :blank)).to be true
  end
end
