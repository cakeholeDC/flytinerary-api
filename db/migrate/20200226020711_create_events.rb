class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :all_day
      t.string :location
      t.string :company_agency
      t.string :reservation_number
      t.text :notes
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
