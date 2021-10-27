require "rails_helper"

RSpec.describe Api::V1::ContactsController, type: :controller do
  include AuthHelper, RequestHelper

  before do
    @user = FactoryBot.create(:user)
    login_user @user
  end

  describe "GET index" do
    it "returns the contacts of current user" do
      contacts = FactoryBot.create_list(:contact, 20, user: @user)

      get :index

      expect(response_body).to eq JSON.parse(@user.contacts.grouped.to_json)
    end
  end

  describe "POST create" do
    it "creates a new contact" do
      contact = {
        first_name: "Test",
        last_name: "User",
        email: "testuser@example.com",
        phone: "1234553634",
      }

      post :create, params: { contact: contact }

      expect(response).to have_http_status(:created)
    end
  end
end
