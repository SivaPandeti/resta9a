class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :customer
  belongs_to :hotel
  attr_accessible :booking_date, :booking_length, :hotel_id, :customer_id, :room_id
end
