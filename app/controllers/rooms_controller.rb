class RoomsController < ApplicationController

  def index
    @rooms = Room.serch(params[:keyword]).page(params[:page])
    @count = Room.serch(params[:keyword]).count
  end

  def show
    @room = Room.find_by(id: params[:id])
    @messages = @room.messages
    if @room == nil
      flash[:danger] = 'ルームが見つかりませんでした'
      redirect_to current_user
    end
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
