class Room < ApplicationRecord
	has_many :bookings
	validates :size, :presence=>true
	validates :building, :presence=>true
	validates :roomid, :presence=>true, :uniqueness => true
end