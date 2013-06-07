class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :users, :through => :rounds
  has_many :categories
  has_many :cards, :through => :categories

  validates :name, :presence => true
  validates :name, :uniqueness => true
  
   
end
