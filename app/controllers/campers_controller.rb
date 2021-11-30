class CampersController < ApplicationController

    def index 
        campers = Camper.all
        render json: campers, status: :ok
    end
    #showing activities for all

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok, serializer: CamperShowSerializer

    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found"}, status: :not_found

    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid
        render json: {errors: ["valdation errors"]}, status: :unprocessable_entity
    end
    

   def camper_params
    params.permit(:name, :age)
   end
end
