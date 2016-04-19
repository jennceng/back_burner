class Chef < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{address} #{city}, #{state} #{zip}"
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
