class Category < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card

  
  # Remember to create a migration!
end
