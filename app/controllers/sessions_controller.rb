class SessionsController < ApplicationController
  acts_as_token_authentication_handler_for User, fallback: :none
  protect_from_forgery with: :null_session, if: :json_request?
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end
  def token_auth
    user= User.find_by_email(params[:email])
    encrypted_password = User.new(password: params[:password]).encrypted_password
    respond_to do |format|
      format.html {  render json: {
        success: true,
        auth_token: user.authentication_token,
        email: user.email
      } }
      format.json do
        if user.encrypted_password == encrypted_password
          render json: {
            success: true,
            auth_token: user.authentication_token,
            email: user.email
          }
        end
      end
    end
  end
  def respond_with_authentication_token(resource)
    render json: {
      success: true,
      auth_token: resource.authentication_token,
      email: resource.email
    }
  end
  def destroy
    session[:user_id] = nil
    @user = nil
    redirect_to root_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
#class Users::SessionsController < Devise::SessionsController
#  def create
#   @user = User.find(params[:id])
#    session[:user_id] = @user.id
#  end
#end