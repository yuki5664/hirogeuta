require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    # 無効な送信
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { artist: "", song: "", youtube_url: "",content: "" } }
    end
    assert_select 'div.alert'
    # 有効な送信
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { artist: "ミスチル", song: "名もなき詩", youtube_url: "https://www.youtube.com/watch?v=gj5Nu6feFTQ", content: "Writing a short test" } }
    end
    assert_redirected_to root_url
    follow_redirect!
    # 投稿を削除する
    get microposts_path(@post)
    first_micropost = @user.microposts.first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
  end
end
