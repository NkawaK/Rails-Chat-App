class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def create
    @user = User.find(current_user[:id])
    @room = @user.rooms.create(room_params)
    if @room.save
      flash[:saccess] = 'ルームを作成しました'
      redirect_to @room
    else
      flash[:danger] = 'ルーム作成に失敗しました'
      redirect_to current_user
    end
  end

  private
    def room_params
      params.require(:room).permit(:keyword, :capacity)
    end
end
