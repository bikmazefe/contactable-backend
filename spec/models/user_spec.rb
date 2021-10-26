require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(8).is_at_most(32) }
end
