class ApplicationGameController < ActionController::Base
  include ApplicationGameHelper
  protect_from_forgery with: :exception
end
