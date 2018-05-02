class PublishingHouse < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :books

  scope :like, ->(args) { where("name like '%#{args}%'")}
end
