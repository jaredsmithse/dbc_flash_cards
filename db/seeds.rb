require 'faker'

10.times do 
  User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: "pass",
    salt: "1234"
    })
end


(1..10).each do |i|
  Deck.create(name: "default", user_id: i )
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

def get_cards
  (1..10).each do |i|
    parse_file('db/flashcard_samples.txt').each do |card|
      Card.create(definition: card[0], word: card[1], deck_id: Deck.find(i).id)
    end
  end
end

get_cards

