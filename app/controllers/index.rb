get '/' do
  redirect '/user/#{params[:user_id]}' if logged_in?
  erb :index
end
