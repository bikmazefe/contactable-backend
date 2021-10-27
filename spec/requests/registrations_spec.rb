require "rails_helper"

RSpec.describe "registrations management" do
  describe "POST create" do
    context "if valid credentials given" do
      it "creates a new user" do
        post "/registrations", params: {
                                 user: {
                                   email: "testtest@example.com",
                                   password: "12345678",
                                   password_confirmation: "12345678",
                                 },
                               }

        expect(response).to have_http_status(:created)
      end
    end

    context "if invalid credentials given" do
      it "responds with 422" do
        post "/registrations", params: {
                                 user: {
                                   email: "",
                                   password: "1234",
                                 },
                               }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
