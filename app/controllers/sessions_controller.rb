class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Signed in successfully.'
    else
      flash.alert = 'Invalid email or password.'
      render :new
    end
  end

  def delete
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out successfully.'
  end
end
