class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.datetime :start
      t.datetime :end
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
