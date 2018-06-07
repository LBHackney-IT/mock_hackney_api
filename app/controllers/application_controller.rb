class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do
    render status: :unprocessable_entity
  end
end
