class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :product_status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_area_id,presence: true
  validates :shipping_day_id,presence: true
  validates :price, presence: true
end
