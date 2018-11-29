class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #모델이 user라서user라고 쓴다. member이면, authenticat_member!라고 쓴다.
end
