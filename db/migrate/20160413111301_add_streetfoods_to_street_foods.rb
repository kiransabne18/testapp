class AddStreetfoodsToStreetFoods < ActiveRecord::Migration
  def change
    add_column :street_foods, :streetfoods, :string
  end
end
