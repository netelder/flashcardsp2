class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :users, :through => :rounds

  validates :name, :presence => true
  validates :name, :uniqueness => true
  # Remember to create a migration!
end
