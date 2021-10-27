require "rails_helper"

module AuthHelper
  def login_user
    user = FactoryBot.create(:user, email: "test@example.com", password: "12345678")
    session[:user_id] = user.id
  end
end
