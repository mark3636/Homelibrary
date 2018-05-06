class Borrowing < ApplicationRecord
  belongs_to :book
  belongs_to :friend

  validates :book, uniqueness: { scope: [:friend, :borrow_date] }
  validates :book, :friend, :borrow_date, presence: true
  validates :return_date, date: { after: :borrow_date }, if: :return_date
end
