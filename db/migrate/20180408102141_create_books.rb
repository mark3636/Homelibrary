class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.integer :pub_year, null: false
      t.string :pic_author
      t.string :translator
      t.string :author, null: false
      t.text   :comment
      t.belongs_to :publishing_house, index: true
      t.timestamps
    end
  end
end
