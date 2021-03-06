# Chirps
class Chirp < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 1, maximum: 255 }
  scope :most_recents, -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
