require 'nokogiri'

class GBiciParser < Parser
	NUMBER_OF_PARKINGS = 14

	def initialize(body)
		@number_of_parkings = NUMBER_OF_PARKINGS

		super(body)
	end

	def parse(body)
		@parking_names = Array.new
		data = JSON.parse(body)["data"]

		data.each do |parking|
			parking_name = parking["descripcion"]
			parking_names << parking_name unless parking_name.empty?
		end
	end

	#create_array_valid_parking_names creates an array with part of valid parking names, to test the correct order.
	def create_array_valid_parking_names
		valid_parking_names = [
			'01 MANUEL AZAÑA',
			'02 C C BUENAVISTA',
			'03 ALHÓNDIGA CENTRO CIVICO',
			'04 ESTACIÓN GETAFE CENTRAL',
			'05 PLAZA CARRETAS',
			'06 PLAZA DE ESPAÑA',
			'07 C\MADRID - DE LA CIERVA',
			'08 C C JUAN DE LA CIERVA',
			'09 RESID. DE ESTUDIANTES',
			'10 FUENTE DE GOYA',
			'11 TRECE ROSAS',
			'12 PARQUE AVIOCAR',
			'13 POLIDEP. ALHÓNDIGA',
			'14 PL. DE LA MAGDALENA'
		]

		return valid_parking_names
	end
end
