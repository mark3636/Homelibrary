class Book < ApplicationRecord
  belongs_to :publishing_house
  has_and_belongs_to_many :genres
  has_many :borrowings
  has_many :friends, through: :borrowings

  validates :name, presence: true
  validates :author, presence: true
end
