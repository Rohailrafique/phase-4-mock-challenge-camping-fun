class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created 
    rescue ActiveRecord::RecordInvalid
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
    #signup belongs to activity

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end


