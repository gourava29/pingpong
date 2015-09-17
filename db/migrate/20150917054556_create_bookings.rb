class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :table_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
