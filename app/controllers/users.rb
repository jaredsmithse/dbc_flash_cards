enable 'sesions'

post '/sign_in' do
  puts "beginning the sign in processs"
  authenticate_user(params[:signin])

  puts "logged in: #{logged_in?}"

  logged_in? ? (redirect '/user') : (redirect '/')
end

post '/sign_up' do
  user_info = parse_user_info(params[:signup])
  new_user = User.create(user_info)
  session[:user_id] = new_user.id
  redirect '/user' 
end 

get '/user' do 
  current_user
  @decks = @current_user.decks
  @deck = []
  @deck << Deck.find(1)
  erb :user
end

post '/logout' do
  session.clear
  redirect '/'
end 

