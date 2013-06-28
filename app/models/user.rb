class User < ActiveRecord::Base
  validates :email, uniqueness: true
  has_many :decks
end
