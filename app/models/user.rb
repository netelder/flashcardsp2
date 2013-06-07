class User < ActiveRecord::Base
  has_secure_password
  
  has_many :rounds
  has_many :decks, :through => :rounds

  validates :email, :uniqueness => true
  validates :email, :password, :name, :presence => true
  # Remember to create a migration!
end
