class Signup < ActiveRecord::Base
  belongs_to :post
  belongs_to :cook 
end
