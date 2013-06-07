class Card < ActiveRecord::Base
  has_many :categories
  has_many :decks, :through => :categories
  
  def correct?(user_guess)
    user_guess == self.answer
  end
end
