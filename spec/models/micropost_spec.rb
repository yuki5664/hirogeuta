require 'rails_helper'

RSpec.describe Micropost, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  it "artist, song, youtube_url, contentを入力したmicropostの投稿が有効になる" do
    new_post = FactoryBot.create(:micropost)
    expect(new_post).to be_valid
  end

  it "artistがなければ無効" do
    post = FactoryBot.build(:micropost, artist: nil)
    post.valid?
    expect(post.errors[:artist]).to include("を入力してください")
  end

  it "songがなければ無効" do
    post = FactoryBot.build(:micropost, song: nil)
    post.valid?
    expect(post.errors[:song]).to include("を入力してください")
  end

  it "songが51文字のときに無効" do
    post = FactoryBot.build(:micropost, song: "a" * 51)
    post.valid?
    expect(post.errors[:song]).to include("は50文字以内で入力してください")
  end

  it "youtube_urlがなければ無効" do
    post = FactoryBot.build(:micropost, youtube_url: nil)
    post.valid?
    expect(post.errors[:youtube_url]).to include("を入力してください")
  end

  it "contentがなければ無効" do
    post = FactoryBot.build(:micropost, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it "contentが251文字のときに無効" do
    post = FactoryBot.build(:micropost, content: "a" * 251)
    post.valid?
    expect(post.errors[:content]).to include("は250文字以内で入力してください")
  end




end
