class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :print_message
  # def catch_email
  #   # begin
  #   #   Rails.logger.info("===========Inbound Connected With Our App========================")
  #   # rescue Exception => e
  #   #   Rails.logger.info("===== Error is #{e}================================")
  #   # end
  #   puts "=======apllication controller method============================"
  #   redirect_to handle_inbound_path
  # end

  # before_action :is_signed_in?

  def print_message
    Rails.logger.info("=====Control reached inside app====================")
  end

  def is_signed_in?
    if !user_signed_in?
      redirect_to new_welcome_path
    else
      puts "======================== User Already Signed In ============================="
        # redirect_to new_user_session_path
      # ..proceed to the action intended to call
    end
  end
end
