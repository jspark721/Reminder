class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |email, password|
      resource = User.find_by_email(email)
    end
  end

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: respond.to_json, status: status
  end


end
