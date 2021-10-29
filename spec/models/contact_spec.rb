require "rails_helper"
require "models/concerns/event_loggable"
RSpec.describe Contact, type: :model do
  it { should belong_to(:user) }
  it_behaves_like("event_loggable")

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }

  it { should validate_length_of(:first_name).is_at_most(50) }
  it { should validate_length_of(:last_name).is_at_most(50) }
  it { should validate_length_of(:phone).is_at_most(20) }
  it { should validate_length_of(:email).is_at_most(320) }

  it "validates if email is unique among user's contacts" do
    user = FactoryBot.create(:user)
    contact1 = FactoryBot.create(:contact, email: "some@example.com", user: user)
    contact2 = FactoryBot.build(:contact, email: "some@example.com", user: user)

    expect(contact2).to be_invalid
  end
end
