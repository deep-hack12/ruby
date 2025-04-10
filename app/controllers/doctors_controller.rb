class DoctorsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
      @doctor=Doctor.all
          render json: @doctor
    end
    def new
      @doctor=Doctor.new
    end
    def show
      @doctor = Doctor.find(params[:id])
      render json: @doctor
    end
    def destroy
      begin
          @doctor = Doctor.find(params[:id])
          @doctor.destroy
          render json: { message: "Employee was successfully deleted." }, status: :ok
      rescue ActiveRecord::RecordNotFound
          render json: { message: "Employee not found." }, status: :not_found
      end
    end
    def create
      @doctor = Doctors.new(user_params)    
      if @doctor.save
        render json: @doctor
      else 
        render json: {message: "Check your entry"}, status: :unprocessable_entity
      end
    end
  private
    def user_params
      params.require(:doctor).permit(:title, :number)
    end
  end

