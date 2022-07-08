FactoryBot.define do
  factory :product do
    user_id               {'1'}
    product_name          {'ああ'}
    description           {'ああああ'}
    category_id           {'2'}
    product_status_id     {'2'}
    shipping_fee_id       {'2'}
    shipping_area_id      {'2'}
    shipping_day_id       {'2'}
    price                 {'10000'}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
