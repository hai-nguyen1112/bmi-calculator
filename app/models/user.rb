class User < ActiveRecord::Base
  has_secure_password
  has_many :records, dependent: :destroy
  validates :username, presence: true, length: {maximum: 10}
  validates :username, uniqueness: true, on: :create
  validates :username, uniqueness: true, on: :update, if: :username_changed?
  validates :password, presence: true, length: {in: 6..20}
  validates :email, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, uniqueness: true, on: :update, if: :email_changed?

end
