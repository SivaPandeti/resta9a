class Customer < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :password, :secret_question, :secret_answer

  has_many :bookings, dependent: :destroy
  has_many :sales, dependent: :destroy
end
