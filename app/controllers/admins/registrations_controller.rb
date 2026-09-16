class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :check_admin_limit, only: [:new, :create]

  private

  def check_admin_limit
    if Admin.count >= Admin::MAX_ADMINS
      redirect_to new_admin_session_path, alert: t('.limit_reached', resource: 'admins')
    end
  end
end
