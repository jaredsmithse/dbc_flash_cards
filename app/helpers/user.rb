helpers do

def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end

def logged_in?
  !current_user.nil?
end

def set_current_user(user_email)
  User.find_by_email(user_email).id
end

def create_user(info)
  info[:salt] = SecureRandom.base64(6)
  info[:password_hash] = Digest::MD5.hexdigest(info[:password_hash] + info[:salt])
  info
end

end
