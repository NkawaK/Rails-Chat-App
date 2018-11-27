class Message < ApplicationRecord
  after_create_commit { BroadCastMessageJob.perform_later self }
  belongs_to :user
  belongs_to :room
end
