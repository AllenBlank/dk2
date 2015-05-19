class Pile < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card
  
  has_many :synergies, class_name:  "Synergy",
                       foreign_key: "pile_id",
                       dependent:   :destroy
  has_many :inversergies, class_name:  "Synergy",
                          foreign_key: "compliment_id",
                          dependent:   :destroy
  has_many :compliments, through: :synergies,  source: :compliment
  
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations
end
