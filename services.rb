require 'json'
require 'net/http'

require_relative 'service'
require_relative 'parsers/parser'

Dir["parsers/*_parser.rb"].each {|file| require_relative file }

class Services
	attr_accessor :services

	def initialize
		loadServices
	end

	def loadServices
		services_file = File.read("services.json")

		services_json = JSON.parse(services_file)

		@services = services_json['services'].map { |service| Service.new(service['name'], service['url'], service['parser']) }
	end

	private :loadServices
end
