class Deck < ActiveRecord::Base
  
  belongs_to :user
  has_many :piles, dependent: :destroy
  has_many :cards, through: :piles
  has_many :synergies, through: :piles
  
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations
  
end

