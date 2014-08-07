require 'nokogiri'

class Parser
	attr_accessor :number_of_parkings, :parking_names, :parking_names_validated, :number_of_parkings_validated, :valid

	def initialize(body)
		parse(body)
		validate
	end

	def validate
		@valid = ((validate_parking_names) and (validate_number_of_parkings))
	end

	def validate_parking_names
		valid = true
		parking_item = 0

		valid_parking_names = create_array_valid_parking_names

		begin
			valid = @parking_names[parking_item].include? valid_parking_names[parking_item]
			parking_item = parking_item + 1
		end while (valid == true) and (parking_item < @parking_names.size-1)

		@parking_names_validated = valid
	end

	def validate_number_of_parkings
		@number_of_parkings_validated = (@parking_names.size == @number_of_parkings)
	end
end