class Cook < ActiveRecord::Base
  has_many :signups, dependent: :destroy
  has_many :jobs, through: :signups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def text_cook(signup)
    number = signup.cook.phone_number
    twilio_client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    twilio_client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: "You have been #{signup.decision.downcase} for a job: https://backburner.herokuapp.com/"
    )
  end

end
