class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:users], unless: :admin_signed_in?
  before_action :authenticate_admin!, only: [:admin]

  def home
  end

  def users
  end

  def admin
    @users = User.all
  end

  def ban_user
    user = User.find(params[:id])
    user.lock_access!
    redirect_to pages_admin_path
  end

  def unban_user
    user = User.find(params[:id])
    user.unlock_access!
    redirect_to pages_admin_path
  end
end
