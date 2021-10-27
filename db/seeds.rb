User.destroy_all

user = User.create(email: "user1@example.com", password: "12345678", password_confirmation: "12345678")

20.times do
  Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    email: Faker::Internet.email,
    user: user,
  )
end

# TODO: Add seed data for event logs
