require 'sinatra'

require_relative 'services'

get '/' do
	@services = Services.new.services

	erb :index
end