class AddTakenToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :taken, :string
  end
end
