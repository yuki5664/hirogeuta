require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:micropost) { FactoryBot.create(:micropost, owner: user) }
  

  it "userがmicropostに対してcommentできる" do
    comments = Comment.new(
      body: "いい曲ですね",
      user: user,
      micropost: micropost,
    )
    expect(comments).to be_valid
  end

  it "micropostがない状態ではcommentできない" do
    comments = Comment.new(micropost: nil)
    comments.valid?
    expect(comments.errors[:micropost]).to include("を入力してください")
  end

  it "bodyがない状態ではcommentできない" do
    comments = Comment.new(body: nil)
    comments.valid?
    expect(comments.errors[:body]).to include("を入力してください")
  end
end
