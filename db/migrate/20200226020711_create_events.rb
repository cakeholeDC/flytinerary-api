class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.references :trip, null: false, foreign_key: true
      t.references :traveler, null: false, foreign_key: true

      t.timestamps
    end
  end
end
