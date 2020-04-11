# Like model
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :chirp

  validates :user_id, uniqueness: { scope: :chirp_id }
end
