# ==========================================================================
# Receiver Controller
# ==========================================================================
# This is the controller that handles event POSTs from the SendGrid Event
# Webhook.
#

#require 'bcrypt'
#require 'permissions'

class ReceiverController < ApplicationController
	protect_from_forgery except: :handle_post

	#before_filter :header_check

	include BCrypt

	def handle_post
		# Handle Post
		puts 'request'
		puts "#{params}  \r\n"
		if params[:_json] then
			cliente =  params[:client]
		end

		if params[:_json] then
			events = params[:_json]
						
			events.each do |linha|
				registro = Sent.new(:account =>cliente, :info =>linha, :active => true)
				registro.save
				puts linha.to_json
			end
		end
	end


	def to_string(value)
		(value.is_a? Array or value.is_a? Hash) ? value.to_json : value
	end

end