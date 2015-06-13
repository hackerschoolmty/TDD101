FactoryGirl.define do
  sequence :username do |n|
    "Username#{n}"
  end

  factory :user do
    email { FFaker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    username
    full_name { FFaker::Name.name }
    bio { FFaker::Lorem.paragraph }
  end
end
