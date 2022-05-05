class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user_, :user_signed_in_?
  acts_as_token_authentication_handler_for User, fallback: :none


  def require_authentication
    # authenticate_or_request_with_http_basic do |u,p|
    #   user = User.find_by(email: u)
    #   true if user && user.authenticate(p)
    # end
  end

  def authenticate
    redirect_to :login unless user_signed_in_?

  end

  def current_user_
    if session[:user_id]
      @current_user_ ||= User.find(session[:user_id])
    else
      @current_user_ = current_user
    end
    @current_user_
    #@current_user ||= User.find(params[:id]) if params[:id]
    #@current_user
  end

  def user_signed_in_?
    # converts current_user to a boolean by negating the negation
    !!current_user_
  end
end
