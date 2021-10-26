FactoryBot.define do
  factory :event_log do
    association(:contact)
  end
end
