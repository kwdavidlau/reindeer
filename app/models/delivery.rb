class Delivery < ActiveRecord::Base
  belongs_to :reindeer
  has_one :gift
end
