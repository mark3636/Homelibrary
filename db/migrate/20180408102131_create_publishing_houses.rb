class CreatePublishingHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :publishing_houses do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
