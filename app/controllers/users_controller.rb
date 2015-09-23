class UsersController < ApplicationController
  before_action :authenticate
  before_action :find_user_by_id, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @users = User.all;
  end

  def show
  end

  def new
    @user = User.new;
  end

  def create
    user = User.new(user_params);
    user.save;
    redirect_to new_session_path;
  end

  def edit
  end

  def update
    @user.update(user_params);
    redirect_to root_path;
  end

  def delete
  end

  def destroy
    @user.destroy;
    redirect_to root_path;
  end

  private
  def user_params
    params.require(:user).permit(:email, :password);
  end

  def find_user_by_id
    @user = User.find(params[:id]);
  end
end
