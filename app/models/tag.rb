class Tag < ActiveRecord::Base
  has_many :tag_relations
  has_many :decks, through: :tag_relations
  has_many :piles, through: :tag_relations
  has_many :synergies, through: :tag_relations
  
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 140 }
  
  before_save { self.name = self.name.downcase }
end
