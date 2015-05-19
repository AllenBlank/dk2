class Expansion < ActiveRecord::Base
  has_many :cards, dependent: :destroy
end
