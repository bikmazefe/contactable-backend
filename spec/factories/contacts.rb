FactoryBot.define do
  factory :contact do
    sequence(:email) { |n| "contact#{n}@example.com" }
    phone { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    association(:user)
  end
end
