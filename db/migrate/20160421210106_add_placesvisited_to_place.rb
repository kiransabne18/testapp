class AddPlacesvisitedToPlace < ActiveRecord::Migration
  def change
    add_column :places, :placesvisited, :string
  end
end
