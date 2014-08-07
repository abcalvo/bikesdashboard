class Service
	attr_accessor :name, :url, :parser, :valid_service, :res_code, :res_msg, :body, :parsed_data

	def initialize(name, url, parser)
		@name = name
		@url = url
		@parser = parser

		getStatus

		parseService

		puts @parsed_data.valid
		puts @parsed_data.parking_names
	end

	def getStatus
		uri = URI.parse(@url.to_s)
		req = Net::HTTP::Get.new(uri.to_s)
		res = Net::HTTP.start(uri.host, uri.port) {|http|
			http.request(req)
		}

		@res_code = res.code.to_i
		@valid_service = (@res_code == 200)
		@res_msg = res.message
		@body = res.body
	end

	def parseService
		data = Object::const_get(@parser).new(@body)

		@parsed_data = data;
	end

	def to_s
		"Name: " + @name + " URL: " + @url + " Status: " + @valid_service ? "Ok" : "Nok" + " Res code: " + @res_code + " Res msg: " + @res_msg
	end
end