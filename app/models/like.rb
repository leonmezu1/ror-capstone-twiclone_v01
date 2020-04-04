# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  validates :user_id, uniqueness: { scope: :opinion_id }
end
