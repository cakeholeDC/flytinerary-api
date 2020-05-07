class AddCoordinatesToEvents < ActiveRecord::Migration[6.0]
  def change
  	add_column :events, :start_latitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :events, :start_longitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :events, :end_latitude, :decimal, {:precision=>10, :scale=>6}
  	add_column :events, :end_longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
