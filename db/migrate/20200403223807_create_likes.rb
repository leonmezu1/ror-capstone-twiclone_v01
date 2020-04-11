# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chirp, null: false, foreign_key: true
    end
  end
end
