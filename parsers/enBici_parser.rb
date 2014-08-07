require 'nokogiri'

class EnBiciParser < Parser
	NUMBER_OF_PARKINGS = 14

	def initialize(body)
		@number_of_parkings = NUMBER_OF_PARKINGS

		super(body)
	end

	def parse(body)
		document = Nokogiri::HTML(body)
		@parking_names = Array.new

		data = document.css('.lat1').xpath('./tr[2]/td/div/table/tr/td/table')

		data.each do |parking|
			parking_name = parking.xpath('./tr/td[2]').text
			parking_names << parking_name unless parking_name.empty?
		end
	end

	#create_array_valid_parking_names creates an array with part of valid parking names, to test the correct order.
	def create_array_valid_parking_names
		valid_parking_names = [
			'Mediterraneo',
			'Europa',
			'Reloj',
			'Carrascal',
			'Besteiro',
			'Fortuna',
			'Central',
			'Miguel',
			'Polvoranca',
			'Nicasio',
			'Severo',
			'Universidad',
			'Valdepelayos',
			'Zarzaquemada'
		]

		return valid_parking_names
	end
end