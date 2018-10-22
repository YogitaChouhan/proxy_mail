class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :check_domain
  has_many :schedules, dependent: :destroy
  has_many :proxy_emails
  after_create :generate_proxy_email

  def check_domain
    if self.email.include?('gmail') || self.email.include?('yahoo') || self.email.include?('mailinator') || self.email.include?('rediffmail') || self.email.include?('hotmail')
      errors.add(:email, :blank, message: "domain is not valid, Please enter business email.")
    end
  end

  def self.add_schedule_form
    @users = User.all
    @users.each do |user|
      UserMailer.with(user: user).add_schedule_form.deliver
    end
  end

  def self.next_week_schedule
    user = User.find(8)
    UserMailer.with(user: user).ceo_list.deliver
  end

  def generate_proxy_email
    proxy_email = SecureRandom.hex + "@theceomap.com"
    email = ProxyEmail.find_by_email(proxy_email)
    unless email.present?
      self.proxy_emails.create(email: proxy_email)
    else
      generate_proxy_email
    end
  end
end
