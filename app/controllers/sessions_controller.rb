class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
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