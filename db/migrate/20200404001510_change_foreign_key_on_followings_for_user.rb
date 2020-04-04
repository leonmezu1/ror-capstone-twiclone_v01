class ChangeForeignKeyOnFollowingsForUser < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :follower_id, on_delete: :cascade
  end
end
