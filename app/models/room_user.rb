class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def self.find_author(room)
    RoomUser.where(room_id: room.id).first.user_id
  end
end
