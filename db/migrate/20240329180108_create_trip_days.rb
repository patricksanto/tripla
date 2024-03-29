class CreateTripDays < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_days do |t|
      t.date :date
      t.integer :day
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
