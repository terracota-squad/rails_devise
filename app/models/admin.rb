class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  MAX_ADMINS = 5

  validate :forbid_extra_admin_creation, on: :create

  private

  def forbid_extra_admin_creation
    if Admin.count >= MAX_ADMINS
      errors.add(:base, :limit_reached, count: MAX_ADMINS)
    end
  end

end
