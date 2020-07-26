require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "名前、メールアドレス、パスワード、アバターが設定されればユーザー登録が有効になる" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "nameがなければ無効になる" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "nameが51文字以上のときに無効になる" do
    user = FactoryBot.build(:user, name: "a" * 51)
    user.valid?
    expect(user.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "emailがなければ無効になる" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "emailが255文字以上のときに無効になる" do
    user = FactoryBot.build(:user, email: "a" * 244 + "@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は255文字以内で入力してください")
  end

  it "passwordがなければ無効になる" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "passwordが5文字以下のとき無効になる" do
    user = FactoryBot.build(:user, password: "a" * 5)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "重複したメールアドレスだと無効な状態になる" do
    FactoryBot.create(:user, email: "hoge@hoge.com")
    user = FactoryBot.build(:user, email: "hoge@hoge.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end


end
