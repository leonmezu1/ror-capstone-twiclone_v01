# frozen_string_literal: true

class ChangeForeignKeyOnFollowings < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :followings, :users, column: :user_id
    add_foreign_key :followings, :users, column: :user_id, on_delete: :cascade
  end
end
