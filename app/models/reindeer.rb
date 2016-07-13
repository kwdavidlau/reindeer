class Reindeer < ActiveRecord::Base
  has_many :gifts
  has_many :children
end
