class Item < ApplicationRecord
  belongs_to :gatepass, inverse_of: :items

  scope :sorted, lambda { order("name ASC") }
end
