FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'iamahackerpleaseletmein'
    password_confirmation 'iamahackerpleaseletmein'
  end
end