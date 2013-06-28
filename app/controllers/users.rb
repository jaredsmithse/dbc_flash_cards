enable 'sesions'

post '/sign_in' do
  authenticate_user(params[:signin])
end

post '/sign_up' do
  user_info = parse_user_info(params[:signup])

  new_user = User.create(user_info)

  session[:user_id] = new_user.id

  redirect '/user/#{new_user.id}'
end 

get '/user/:user_id' do 
  current_user
  erb :user
end

