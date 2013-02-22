class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :quantity
      t.string :credit_card_no
      t.decimal :discount
      t.references :product
      t.references :customer

      t.timestamps
    end
    add_index :sales, :product_id
    add_index :sales, :customer_id
  end
end
