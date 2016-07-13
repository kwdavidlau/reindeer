class Child < ActiveRecord::Base
  has_one :gift
  belongs_to :reindeer
end
