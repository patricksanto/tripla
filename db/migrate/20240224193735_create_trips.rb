class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :place
      t.date :date
      t.integer :duration
      t.references :owned_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
