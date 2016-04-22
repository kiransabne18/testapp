class AddDeliveryToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :delivery, :string
  end
end
