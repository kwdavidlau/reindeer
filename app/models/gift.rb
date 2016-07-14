class Gift < ActiveRecord::Base
  has_one :child
  belongs_to :delivery
end
