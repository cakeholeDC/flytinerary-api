class CreateTravelerTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :traveler_trips do |t|
      t.references :traveler, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
