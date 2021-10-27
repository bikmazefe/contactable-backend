require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  include AuthHelper, RequestHelper

  describe "GET /logged_in" do
    context "if valid credentials given" do
      it "responds with logged_in: true" do
        login_user

        get :logged_in

        expect(response_body["logged_in"]).to be true
      end
    end

    context "if invalid credentials given" do
      it "responds with logged_in: true" do
        get :logged_in

        expect(response_body["logged_in"]).to be false
      end
    end
  end
end
