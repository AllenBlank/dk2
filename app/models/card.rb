class Card < ActiveRecord::Base
  
  belongs_to :expansion
  has_many :piles, dependent: :destroy
  has_many :decks, through: :piles
  has_many :tags, through: :piles
  
  serialize :types
  serialize :colors
  serialize :rulings
  serialize :names
  serialize :color_id
  serialize :formats
  
  def image_path
    "http://magiccards.info/scans/en/#{self.expansion.code}/#{self.number}.jpg"
  end
  
end
