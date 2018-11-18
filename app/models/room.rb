class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  validates :keyword, presence: true, length: { maximum: 20}
end
