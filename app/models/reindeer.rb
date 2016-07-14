class Reindeer < ActiveRecord::Base
  has_many :deliverys
end

# create_table "reindeers", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "mobile"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
