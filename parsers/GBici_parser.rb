require 'nokogiri'

class GBiciParser < Parser
	NUMBER_OF_PARKINGS = 14

	def initialize(body)
		@number_of_parkings = NUMBER_OF_PARKINGS

		super(body)
	end

	def parse(body)
		document = Nokogiri::HTML(body)
		@parking_names = Array.new

		data = document.css('#PnlTablas table')
		
		data.each do |parking|
			parking_name = parking.xpath('./tr[1]/td[1]/table[1]/tr[1]/td[2]/font/b').text
			parking_names << parking_name unless parking_name.empty?
		end
	end

	#create_array_valid_parking_names creates an array with part of valid parking names, to test the correct order.
	def create_array_valid_parking_names
		valid_parking_names = [
			'ARROYO CULEBRO',
			'C C BUENAVISTA',
			'ALHÓNDIGA',
			'ESTACIÓN GETAFE CENTRAL',
			'PLAZA CARRETAS',
			'PLAZA DE ESPAÑA',
			'C\MADRID',
			'C C JUAN',
			'RESID.',
			'FUENTE',
			'TRECE',
			'AVIOCAR',
			'POLIDEP',
			'MAGDALENA'
		]

		return valid_parking_names
	end
end