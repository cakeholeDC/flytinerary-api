class AddCoordinatesToTrip < ActiveRecord::Migration[6.0]
  def change
  	add_column :trips, :latitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :trips, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
