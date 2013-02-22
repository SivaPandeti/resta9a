class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :address
      t.string :city
      t.string :email
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
