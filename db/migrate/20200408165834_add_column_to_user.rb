# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
  end
end
