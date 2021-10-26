require "rails_helper"

RSpec.describe Contact, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }

  it "validates if email is unique among users' contacts" do 
    user = FactoryBot.create(:user)
    contact1 = FactoryBot.create(:contact, email: "some@example.com", user: user)
    contact2 = FactoryBot.build(:contact, email: "some@example.com", user: user)

    expect(contact2).to be_invalid
  end
end
