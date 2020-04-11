# frozen_string_literal: true

# Migration
class ForceCascadeOnDelete < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :comments, :chirps
    add_foreign_key :comments, :chirps, on_delete: :cascade
    remove_foreign_key :likes, :chirps
    add_foreign_key :likes, :chirps, on_delete: :cascade
  end
end
