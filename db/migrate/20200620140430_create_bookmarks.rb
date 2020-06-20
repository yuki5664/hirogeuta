class CreateBookmarks < ActiveRecord::Migration[6.0]

  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :micropost, foreign_key: true, null: false

      t.timestamps
      t.index [:user_id, :micropost_id], unique: true # 追加
    end
  end

end
