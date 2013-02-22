class Order < ActiveRecord::Base
  belongs_to :item
  attr_accessible :quantity, :item_id



end
