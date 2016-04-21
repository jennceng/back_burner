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
end
