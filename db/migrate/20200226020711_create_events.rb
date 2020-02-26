class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :start_location
      t.string :end_location
      t.string :company_agency
      t.string :reservation_number
      t.text :notes
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
