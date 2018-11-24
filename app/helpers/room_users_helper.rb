module RoomUsersHelper
  def room_user?
    RoomUser.find_by(room_id: params[:id], user_id: current_user[:id])
  end
end
