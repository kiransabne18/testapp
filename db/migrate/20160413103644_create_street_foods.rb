class CreateStreetFoods < ActiveRecord::Migration
  def change
    create_table :street_foods do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
