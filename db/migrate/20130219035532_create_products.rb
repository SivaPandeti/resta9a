class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :subcategory
      t.string :brand
      t.string :model
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
