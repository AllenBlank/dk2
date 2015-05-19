class Search < ActiveRecord::Base
  belongs_to :user
  serialize :colors
end
