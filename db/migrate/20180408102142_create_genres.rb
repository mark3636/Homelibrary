class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.integer :parent_genre, null: true
      t.timestamps
    end

    create_table :books_genres, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :genre, index: true
    end
  end
end
