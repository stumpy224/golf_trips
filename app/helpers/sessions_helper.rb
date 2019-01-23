module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])

    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)

      if user && user.is_authenticated?(:remember, cookies[:remember_token])
        login(user)
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def is_admin?
    return logged_in? && current_user.is_admin?
  end

  def remember(user)
    user.create_remember_digest
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
