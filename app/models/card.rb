class Card < ActiveRecord::Base
 belongs_to :topic
  
  def correct?(user_guess)
    user_guess == self.answer
  end
end
