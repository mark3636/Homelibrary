class Friend < ApplicationRecord
  VALID_EMAIL_REGEX = /[\wа-я\.\+]+@([\wа-я]+\.?)+/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :full_name, presence: true
  validates :phone_number, presence: true, uniqueness: true

  has_many :borrowings
  has_many :books, through: :borrowings

  scope :like, ->(args) { where("full_name like '%#{args}%'")}
end
