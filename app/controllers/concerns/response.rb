module Response
	def json_response(object, status = :ok)
		if status == :ok
			render json: object, status: status
		else
			render :json => { :errors => object.errors }
		end
	end	
end