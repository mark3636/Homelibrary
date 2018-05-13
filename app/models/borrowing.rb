class Borrowing < ApplicationRecord
  belongs_to :book
  belongs_to :friend

  validates :book, uniqueness: { scope: [:friend, :borrow_date] }
  validates :book, :friend, :borrow_date, presence: true
  validates :return_date, date: { after: :borrow_date }, if: :return_date

  scope :is_lost, ->{ where(is_lost: true)}
  scope :is_damaged, ->{ where(is_damaged: true)}
end
