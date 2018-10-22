class UserMailer < ApplicationMailer
  default from: 'yogita.chouhan@example.com'

  def add_schedule_form
    @user = params[:user]
    mail(:to => @user.email, :subject => "Weekly email for next week schedule")
  end

  def ceo_list
    mail(:to => "yuvasoft131@gmail.com", :subject => "List of all CEO/CFO schedule", reply_to: params[:user].proxy_emails.last.email)
    # mail(:to => "7639fb5838218d96e007aaaa26566349@theceomap.com", :subject => "List of all CEO/CFO schedule", reply_to: params[:user].proxy_emails.last.email)
  end
end

