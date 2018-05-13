class Book < ApplicationRecord
  belongs_to :publishing_house
  has_and_belongs_to_many :genres
  has_many :borrowings, dependent: :delete_all
  has_many :friends, through: :borrowings

  validates :name, :author, :pub_year, :genres, :publishing_house, presence: true
  validates :pub_year, numericality: { only_integer: true,
                                       greater_than: 1800,
                                       less_than_or_equal_to: DateTime.now.year}


  scope :like, ->(args) { where("lower(name) like '%#{args}%'")}
end
