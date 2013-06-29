get '/deck/:deck_id' do

  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :card
end
