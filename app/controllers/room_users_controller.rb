class RoomUsersController < ApplicationController

  def new
    redirect_to current_user and return if no_vacancy?
    @room_user = RoomUser.new(user_id: current_user[:id], room_id: params[:id])
    @room_user.save
    redirect_to @room
  end

  def no_vacancy?
    @room = Room.find_by(id: params[:id])
    @room.capacity == @room.user_ids.count
  end
end
