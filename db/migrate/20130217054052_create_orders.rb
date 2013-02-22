class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :item

      t.timestamps
    end
    add_index :orders, :item_id
  end
end
