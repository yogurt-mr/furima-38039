class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id,presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
end
