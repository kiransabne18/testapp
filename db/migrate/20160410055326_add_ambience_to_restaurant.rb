class AddAmbienceToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :ambience, :string
  end
end
