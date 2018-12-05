module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete(:user_id)
    session.delete(:user_id)
    current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwording_url] || default)
    session.delete(:forwording_url)
  end

  def store_location
    session[:forwording_url] = request.original_url if request.get?
  end

  def logged_in_user
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end
end
