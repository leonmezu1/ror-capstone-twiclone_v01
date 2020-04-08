# frozen_string_literal: true

# Migration
class RefactorForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :comments, :users
    add_foreign_key :comments, :users, on_delete: :cascade
    remove_foreign_key :likes, :users
    add_foreign_key :likes, :users, on_delete: :cascade
    remove_foreign_key :chirps, :users
    add_foreign_key :chirps, :users, on_delete: :cascade
  end
end



