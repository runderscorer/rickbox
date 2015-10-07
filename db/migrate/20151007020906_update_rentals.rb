class UpdateRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :returned_at, :date
  end
end
