class PetsController < ApplicationController
	before_action :set_pet, only: [:show, :update, :destroy]

	def index
		@pets = Pet.all
		json_response(@pets)
	end

	def show
		json_response(@pet)
	end

	def update
		@pet.update(pet_params)
		head :no_content
	end

	def destroy
		@pet.destroy
		head :no_content
	end

	def create
		@pet = Pet.create(pet_params)
			json_response(@pet, :created)

	end

	private

	def pet_params
		params.require(:pet).permit(:name, :owner_name)
	end

	def set_pet
		@pet = Pet.find(params[:id])
	end
end


# httpie
# https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

# GET /pets
# $ http :3000/pets
# POST /pets
# $ http POST :3000/todos name=kara owner_name=Mozart
# PUT /pets/:id
# $ http PUT :3000/pets/1 name=kara
# DELETE /pets/:id
# $ http DELETE :3000/pets/1
