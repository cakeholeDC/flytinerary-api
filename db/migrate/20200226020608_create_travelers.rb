class CreateTravelers < ActiveRecord::Migration[6.0]
  def change
    create_table :travelers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
