require "rails_helper"

RSpec.describe EventLog, type: :model do
  it { should belong_to(:contact) }

  it { should validate_presence_of(:action) }
end
