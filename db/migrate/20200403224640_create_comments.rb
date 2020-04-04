# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chirp, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
