class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  attr_accessible :credit_card_no, :discount, :quantity, :customer_id, :product_id
end
