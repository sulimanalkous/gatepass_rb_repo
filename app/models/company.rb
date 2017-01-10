class Company < ApplicationRecord
  has_many :gatepasses

  scope :sorted, lambda { order("name ASC") }
end
