require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(artist: "ミスチル", song: "名もなき詩", youtube_url: "gj5Nu6feFTQ", content: "すごくいい曲です", user_id: @user.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "artist should be present" do
    @micropost.artist = "   "
    assert_not @micropost.valid?
  end

  test "song should be present" do
    @micropost.song = "   "
    assert_not @micropost.valid?
  end

  test "youtube_url should be present" do
    @micropost.youtube_url = "   "
    assert_not @micropost.valid?
  end

  test "artist should be at most 50 characters" do
    @micropost.artist = "a" * 51
    assert_not @micropost.valid?
  end

  test "song should be at most 50 characters" do
    @micropost.song = "a" * 51
    assert_not @micropost.valid?
  end

  test "youtube_url should be at most 50 characters" do
    @micropost.youtube_url = "a" * 51
    assert_not @micropost.valid?
  end

  test "content should be at most 50 characters" do
    @micropost.content = "a" * 251
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
