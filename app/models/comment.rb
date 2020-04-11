# Comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  validates :content, presence: true, length: { minimum: 1, maximum: 255 }
end
