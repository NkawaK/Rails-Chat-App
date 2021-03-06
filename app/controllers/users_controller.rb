class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pagenate_rooms = []
    build_rooms = []
    join_rooms = []
    @user.rooms.each do |room|
      @user.id == RoomUser.find_author(room) ? build_rooms << room : join_rooms << room
    end
    @paginate_rooms = Kaminari.paginate_array(build_rooms +join_rooms).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = 'ユーザーを登録しました！'
      redirect_back_or @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
