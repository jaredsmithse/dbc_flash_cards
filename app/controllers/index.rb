get '/' do
  redirect '/user' if logged_in?
  erb :index
end
