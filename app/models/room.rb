class Room < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :room_name, :room_rate, :room_type, :hotel_id

  has_many :bookings, dependent: :destroy
end
