helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def set_session_id(user_email)
    session[:user_id] = User.find_by_email(user_email).id
  end

  def parse_user_info(info)
    info[:salt] = SecureRandom.base64(6)
    info[:password_hash] = Digest::MD5.hexdigest(info[:password_hash] + info[:salt])
    info
  end

end
