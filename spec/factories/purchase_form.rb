FactoryBot.define do
  factory :purchase_form do
    user_id    {'1'}
    product_id {'1'}
    token          {'tok_abcdefghijk00000000000000000'}
    zip_code    {'123-4567'}
    shipping_area_id  {3}
    city      {'長崎市'}
    street_number     {'1-1-1'}
    building  {'ビルビルディング'}
    phone_number   {'09033334444'} 
  end
end
