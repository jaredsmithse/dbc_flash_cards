get '/deck/:deck_id' do

  @deck = Deck.find(params[:deck_id])
  cards = @deck.cards
  @card = cards.shuffle!.pop
  erb :card
end

post '/guess' do
  @card = Card.find(params[:card_id])
  params[:current_guess] == @card.word ? "true" : "false"
end

# get '/guess' do
#   erb :card
# end
