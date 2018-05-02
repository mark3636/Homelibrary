class Genre < ApplicationRecord
  has_many :child_genres, class_name: "Genre"
  belongs_to :parent_genre, class_name: "Genre", foreign_key: "parent_genre",
                            optional: true
  has_and_belongs_to_many :books

  validates :name, presence: true, uniqueness: true

  scope :like, ->(args) { where("name like '%#{args}%'")}
end
