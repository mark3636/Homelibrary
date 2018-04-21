class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :full_name, null: false
      t.string :phone_number, null: false
      t.string :social_profile
      t.string :email, null: false
      t.text :comment
      t.timestamps
    end
  end
end
