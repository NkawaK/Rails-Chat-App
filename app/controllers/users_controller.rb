class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @build_rooms = []
    @join_rooms = []
    @user.rooms.each do |room|
      if @user.id == RoomUser.find_author(room)
        @build_rooms << room
      else
        @join_rooms << room
      end
    end
    @paginate_build_room = Kaminari.paginate_array(@build_rooms).page(params[:page]).per(1)
    @paginate_join_room = Kaminari.paginate_array(@join_rooms).page(params[:page]).per(1)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = 'ユーザーを登録しました！'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
