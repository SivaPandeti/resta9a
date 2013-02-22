namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_items
    make_orders
    make_customers
    make_hotels
  end
end

def make_items
	10.times do |n|
		name = "Dish-#{n+1}"
		price = (rand(10)+1)*5
		Item.create!(name: name,
			         price: price)
	end
end

def make_orders
	35.times do |n|
		item_id = (rand(10)+1)
		quantity = (rand(5)+1)
		Order.create!(item_id: item_id,
					   quantity: quantity)
	end
end

def make_customers
	50.times do |n|
		first_name = Faker::Name.first_name
		last_name = Faker::Name.last_name
		email = Faker::Internet.email
		phone = Faker::PhoneNumber.phone_number
		Customer.create!(first_name: first_name,
			             last_name: last_name,
			             email: email,
			             phone: phone)
	end
end

def make_hotels
	10.times do |n|
		hotel_name = "Hotel-#{n+1}"
		address = Faker::Address.street_address
		city = Faker::Address.city
		Hotel.create!(hotel_name: hotel_name,
			          address: address,
			         city: city)
	end
end

