class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  has_one :shipping_address
end
