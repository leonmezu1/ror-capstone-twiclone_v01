# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  validates :content, presence: true, length: { minimum: 5, maximum: 255 }
end
