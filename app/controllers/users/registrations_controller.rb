class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :position, :company_ticker)
  end
end
