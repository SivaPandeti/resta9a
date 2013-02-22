class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.integer :booking_length
      t.references :room
      t.references :customer
      t.references :hotel

      t.timestamps
    end
    add_index :bookings, :room_id
    add_index :bookings, :customer_id
    add_index :bookings, :hotel_id
  end
end
