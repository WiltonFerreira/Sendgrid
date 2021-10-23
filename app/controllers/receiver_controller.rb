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
		#puts 'request'
		#puts "#{params}  \r\n"
		if params[:_json] then
			cliente =  params[:client]
		end

		if params[:_json] then
			events = params[:_json]
			
			events.each do |event|
				
				registro = Sent.new(:account =>cliente, :info =>event, :active => true)
				registro.save
			end
			
			render json: {
				:message => :"Post accepted"
			}
		else
			render json: {
				:message => :error,
				:error => "Unexpected content-type. Expecting JSON."
			}, status => 400	
		end
	end

end