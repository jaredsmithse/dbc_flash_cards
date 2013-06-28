helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    p current_user
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

  def authenticate_user(info)
    user = User.find_by_email(info[:email])
    user_password = user.password_hash
    given_password = Digest::MD5.hexdigest(info[:password_hash] + user.salt)
    

    if user_password == given_password 
      set_session_id(user.email)
      current_user
    end
  end

  def parse_file(file_name)
  file = File.open(file_name,"r")
    data = file.read
    file.close
    all_data = []

    data = data.split("\n")
    data.delete(" ")

    all_data = Array.new((data.length/2)) {data.shift(2)}
    return all_data
  end

end
