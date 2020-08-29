require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:micropost, owner: @user)
      @like = Like.create(user_id: @user.id, micropost_id: @post.id) 
    end

  describe "POST #create" do
    
    it "responds with JSON formatted output" do
      likes = Like.new(
      micropost_id: @post.id,
      user_id: @user.id,
      id: @like,
      )
      expect(likes).to be_valid
    end
  end
end
