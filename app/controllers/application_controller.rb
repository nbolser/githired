class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing do |_exception|
    head :unprocessable_entity, content_type: 'text/html'
  end
end
