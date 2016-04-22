class Chef < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def text_chef(signup)
    number = phone_number
    twilio_client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    binding.pry
    twilio_client.account.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: "#{signup.cook.full_name} has signed up for one of your job posts! https://backburner.herokuapp.com/"
    )
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :restaurant_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
