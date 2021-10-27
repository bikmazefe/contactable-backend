class Api::V1::BaseController < ApplicationController
  include CurrentUserConcern
  before_action :authenticate_user

  private

  def authenticate_user
    head :unauthorized unless @current_user
  end
end
