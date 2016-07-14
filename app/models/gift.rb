class Gift < ActiveRecord::Base
  has_one :child
  has_one :delivery
end
