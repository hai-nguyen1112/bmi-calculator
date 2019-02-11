class Record < ActiveRecord::Base
  belongs_to :user
  validates :weight, presence: true, numericality: {greater_than: 0, only_number: true}
  validates :height_ft, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 6, only_integer: true}
  validates :height_in, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 11, only_integer: true}
  validates :age, presence: true, numericality: {greater_than: 0, only_integer: true}
end
