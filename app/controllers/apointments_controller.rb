class ApointmentsController < ApplicationController
skip_before_action :verify_authenticity_token
  def index 
    @apointment=Apointment.all
      render json: @apointment.as_json(include: [:doctor,:patiant])
    end
    def new
      @apointment=Apointment.new
    end
    def show
      @apointment = Apointment.find(params[:id])
      render json: @apointment.as_json(include: [:doctor, :patiant])
    end
    def destroy
      begin
        @apointment = Apointment.find(params[:id])
        @apointment.destroy
        render json: { message: "Employee was successfully deleted." }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: "Employee not found." }, status: :not_found
    end
  end
    def create
      @apointment = Apointments.new(user_params)    
      if @apointment.save
        render json: @apointment
      else 
          render json: {message: "Check your entry"}, status: :unprocessable_entity
      end
    end
  private
    def user_params
      params.require(:apointments).permit(:timing, :identity, :doctor_id, :patiant_id)
    end
  end
