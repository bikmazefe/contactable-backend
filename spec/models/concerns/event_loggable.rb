shared_examples "event_loggable" do
  it { should have_many(:event_logs) }

  context "when created" do
    it "creates a new event log" do
      contact = FactoryBot.create(:contact)

      expect(contact.event_logs.size).to eq 1
      expect(contact.event_logs.sentence_array).to include "Contact created."
    end
  end
  context "when updated" do
    it "creates a new event log" do
      contact = FactoryBot.create(:contact, email: "old_email@example.com", phone: "1234567890", first_name: "Old", last_name: "Guy")

      contact.update(email: "new_email@example.com", phone: "0987654321", first_name: "New", last_name: "Person")

      expect(contact.event_logs.sentence_array).to include "Email changed to new_email@example.com from old_email@example.com"
      expect(contact.event_logs.sentence_array).to include "Phone changed to 0987654321 from 1234567890"
      expect(contact.event_logs.sentence_array).to include "First name changed to New from Old"
      expect(contact.event_logs.sentence_array).to include "Last name changed to Person from Guy"
    end
  end
end
