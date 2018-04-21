class Borrowing < ApplicationRecord
  belongs_to :book
  belongs_to :friend
  validates :book, uniqueness: {scope: [:friend, :borrow_date]}
end
