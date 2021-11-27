class Api::BaseController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate_api_token!

  # private

  # def authenticate_api_token!
  #   if (user = user_from_token)
  #     sign_in user, store: false
  #   else
  #     head :unauthorized
  #   end
  # end

  # def token_from_header
  #   request.headers.fetch("Authorization", "").split(" ").last
  # end

  # def api_token
  #   @_api_token ||= LoggedApplication.find_by(token: token_from_header)
  # end

  # def user_from_token
  #   if api_token.present?
  #     api_token.touch(:last_used_at)
  #     api_token.user
  #   end
  # end
end

