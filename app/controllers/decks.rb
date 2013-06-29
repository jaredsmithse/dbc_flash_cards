get '/deck/:deck_id' do

  @deck = Deck.find(params[:deck_id])
  cards = @deck.cards
  @card = cards.shuffle!.pop
  erb :card
end

post '/guess' do
  params[:current_guess] == @card.word
end
