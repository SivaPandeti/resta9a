class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.decimal :room_rate
      t.string :room_type
      t.references :hotel

      t.timestamps
    end
    add_index :rooms, :hotel_id
  end
end
