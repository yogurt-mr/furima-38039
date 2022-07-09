class PurchaseForm
  include ActiveModel::Model
  # product_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :product_id, :zip_code, :shipping_area_id, :city, :street_number, :building, :phone_number, :token

  # 4行目と同じくこのタイミングでは生成前なので「validates :product_id」は不要
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    @purchase=Purchase.create(user_id: user_id, product_id: product_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「purchase_id」が生成され、保存される。
    ShippingAddress.create(purchase_id: @purchase.id, zip_code: zip_code, shipping_area_id: shipping_area_id, city: city, street_number: street_number, building: building, phone_number: phone_number)
  end
end
