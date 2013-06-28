require 'faker'
require_relative('flashcard_samples.txt')

10.times do 
  User.create({
    name: Faker::Name,
    email: Faker::Internet.email,
    password_hash: "pass",
    salt: "1234"
    })
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
  parse_file('flashcard_samples.txt').each do |card|
  Card.create(definition: card[0], word: card[1], deck: 1)
end

get_cards
Deck.create(name: "default", user: rand(1..10))


