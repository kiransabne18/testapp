class AddReservationsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :reservation, :string
  end
end
