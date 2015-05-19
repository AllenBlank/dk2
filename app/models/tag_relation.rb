class TagRelation < ActiveRecord::Base
  belongs_to :tag
  
  belongs_to :deck
  belongs_to :pile
  belongs_to :synergy
  
  validates :tag_id, presence: true
  validate :has_references
  
  private
    def has_references
      unless ( self.pile_id || self.deck_id || self.synergy_id )
        errors.add(:tag, "TagPin must have a reference to a deck, synergy or pile.") 
      end
    end
end
