# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      # login
      log_in user
    else
      flash[:danger] = 'Wrong information. Please check.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You logged out! See you soon!'
  end
end
