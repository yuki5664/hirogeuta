class AddLikesCountToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :likes_count, :integer
  end
end
