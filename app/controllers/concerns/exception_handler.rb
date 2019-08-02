module ExceptionHandler
	extend ActiveSupport::Concern

	include do
		rescue_from ActiveRecord::REcordNotFound do |e|
			json_response({ message: e.message }, :not_found)
		end
		
		rescue_from ActiveRecord::RecordInvalid do |e|
			json_response({ message: e.message }, :unprocessable_entity)
		end
	end
end				