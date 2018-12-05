module RoomUsersHelper
  def room_user?
    return unless logged_in?
    RoomUser.find_by(room_id: params[:id], user_id: current_user[:id])
  end
end
