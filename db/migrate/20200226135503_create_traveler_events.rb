class CreateTravelerEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :traveler_events do |t|
      t.references :traveler, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
