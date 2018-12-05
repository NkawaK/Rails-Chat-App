class RoomUsersController < ApplicationController

  def new
    logged_in_user and return unless logged_in?
    @room_user = RoomUser.new(user_id: current_user[:id], room_id: params[:id])
    @room_user.save
    redirect_to @room
  end

  def no_vacancy?
    @room = Room.find_by(id: params[:id])
    @room.capacity == @room.user_ids.count
  end
end
