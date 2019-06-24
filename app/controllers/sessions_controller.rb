# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      # login
      log_in user
      redirect_to root_path
    else
      flash[:danger] = 'Wrong information. Please check.'
      redirect_to login_url
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You logged out! See you soon!'
  end
end
