class Post < ActiveRecord::Base
  belongs_to :chef
  has_many :signups
  has_many :cooks, through: :signups

  validates :chef, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wage, presence: true

  # def selected_cook
  #   self.cooks.where(selected = true)
  # end
end
