class Booking < ApplicationRecord
	belongs_to :room
	belongs_to :libraryuser
	
	validates :start_time, uniqueness: {scope: [:room_id,:date,:libraryuser_id]}

	validates :room_id, :presence=>true
	validates :date, :presence=>true
	validates :start_time, :presence=>true
	validates :libraryuser_id, :presence=>true

end
