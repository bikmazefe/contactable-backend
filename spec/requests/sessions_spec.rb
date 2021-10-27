require "rails_helper"
RSpec.describe "session management", type: :request do
  include RequestHelper

  describe "POST create" do
    context "if valid credentials given" do
      it "creates a session" do
        user = FactoryBot.create(:user)

        post "/sessions", params: {
                            user: {
                              email: user.email,
                              password: user.password,
                            },
                          }

        expect(response).to have_http_status(:created)
        expect(response_body["user"]["id"]).to eq user.id
      end
    end

    context "if invalid credentials given" do
      it "responds with 401" do
        user = FactoryBot.create(:user)

        post "/sessions", params: {
                            user: {
                              email: "wrong_email@example.com",
                              password: "somepassword",
                            },
                          }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
