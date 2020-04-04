class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :follower, null: false, index: true

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
  end
end
