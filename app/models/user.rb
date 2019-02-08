class User < ActiveRecord::Base
  has_many :records
  has_many :advices, through: :records

end
