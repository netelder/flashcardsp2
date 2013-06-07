class Card < ActiveRecord::Base
  has_many :categories
  has_many :decks, :through => :categories
  # Remember to create a migration!
end
