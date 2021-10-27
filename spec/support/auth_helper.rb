require "rails_helper"

module AuthHelper
  def login_user(given_user = nil)
    user = given_user || FactoryBot.create(:user, email: "test@example.com", password: "12345678")
    session[:user_id] = user.id
  end
end
