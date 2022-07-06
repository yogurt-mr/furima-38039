FactoryBot.define do
  factory :user do
    nickname              {'やまたろ'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    email                 {'test@example'}
    password              {'0000aa'}
    password_confirmation {password}
    dob                   {DateTime.now}
  end
end