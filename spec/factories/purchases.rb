FactoryBot.define do
  factory :purchase do
    postal_code    {'123-4567'}
    shipping_area_id  {3}
    city      {'長崎市'}
    street_number     {'1-1-1'}
    building  {'ビルビルディング'}
    phone_number   {'09033334444'}
    association :user
    association :product 
  end
end
