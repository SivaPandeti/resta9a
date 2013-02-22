class Item < ActiveRecord::Base
  attr_accessible :name, :price

  has_many :orders, dependent: :destroy
end
