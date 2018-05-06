class CreateBorrowings < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowings do |t|
      t.belongs_to :book, index: true
      t.belongs_to :friend, index: true
      t.datetime :borrow_date, null: false
      t.boolean :is_lost
      t.boolean :is_damaged
      t.datetime :return_date
      t.text :comment
      t.timestamps
    end

    add_index :borrowings, [:book_id, :friend_id, :borrow_date], unique: true
  end
end
