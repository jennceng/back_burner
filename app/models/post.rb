class Post < ActiveRecord::Base
  belongs_to :chef

  validates :chef, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wage, presence: true 
end
