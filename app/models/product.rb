class Product < ActiveRecord::Base
  attr_accessible :brand, :category, :description, :model, :price, :subcategory

  has_many :sales, dependent: :destroy
end
