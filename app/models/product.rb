class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 } 
  end
end
