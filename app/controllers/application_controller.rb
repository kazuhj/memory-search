class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

  private

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["MEMOBASIC_AUTH_USER"] && password == ENV["MEMOBASIC_AUTH_PASSWORD"]
    end
  end
end
