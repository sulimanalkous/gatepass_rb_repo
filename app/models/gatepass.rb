class Gatepass < ApplicationRecord
  belongs_to :user
  belongs_to :gate_type
  belongs_to :company
  belongs_to :national
  belongs_to :section

  has_many :items, inverse_of: :gatepass
  accepts_nested_attributes_for :items, allow_destroy: true,
      reject_if: -> (attrs) { attrs['name'].blank? || attrs['qty'].blank? }

  scope :newest_first, lambda { order("created_at DESC") }

end
