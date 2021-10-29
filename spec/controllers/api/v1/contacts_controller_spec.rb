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

  describe "GET show" do
    it "returns the event logs" do
      contact = FactoryBot.create(:contact, user: @user)

      get :show, params: { id: contact.id }

      expect(response_body["logs"].first["event"]).to eq "Contact created."
    end
  end

  describe "POST create" do
    context "if valid attrs given" do
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
    context "if invalid attrs given" do
      it "responds with 422" do
        contact = {
          first_name: "",
          last_name: "",
          email: nil,
        }

        post :create, params: { contact: contact }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH update" do
    context "if valid credentials given" do
      it "updates the contact" do
        contact = FactoryBot.create(
          :contact,
          first_name: "I am",
          last_name: "Gonna be updated",
          email: "soontobechanged@example.com",
          phone: "123123123",
          user: @user,
        )

        new_attrs = {
          first_name: "Changed",
          last_name: "Name",
          email: "changed@example.com",
          phone: "37457457457",
        }

        patch :update, params: { contact: new_attrs, id: contact.id }
        contact.reload

        expect(response).to have_http_status(:ok)
        expect(contact.first_name).to eq "Changed"
        expect(contact.last_name).to eq "Name"
        expect(contact.email).to eq "changed@example.com"
        expect(contact.phone).to eq "37457457457"
      end
    end
    context "if invalid attrs given" do
      it "responds with 422" do
        contact = FactoryBot.create(:contact, user: @user)
        invalid_attrs = {
          first_name: "",
          last_name: "",
          email: nil,
        }

        patch :update, params: { contact: invalid_attrs, id: contact.id }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the contact" do
      contact = FactoryBot.create(:contact, user: @user)

      delete :destroy, params: { id: contact.id }

      expect(response).to have_http_status(:ok)
    end
  end
end
