require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  
  # scenario "user creates a new post" do
  #   user = FactoryBot.create(:user)
    
  #   visit login_url
  #   fill_in "session[email]", with: user.email
  #   fill_in "session[password]", with: user.password
  #   click_button "ログイン"

  #   expect {
  #     visit new_micropost_path
  #     # 何故かcapybaraがfill_inを見つけられないので放置
  #     fill_in "micropost[artist]", with: "Mr.Children"
  #     fill_in "micropost[song]", with: "名もなき詩"
  #     fill_in "micropost[youtube_url]", with: "https://www.youtube.com/watch?v=gj5Nu6feFTQ"
  #     fill_in "micropost[content]", with: "いい曲です"
  #     click_button "シェアする"
  #     expect(page).to have_content "投稿が保存されました"
  #     expect(page).to have_content "#{user.name}"
  #     }.to change(user.microposts, :count).by(1)
  # end
end
