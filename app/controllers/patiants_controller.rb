class PatiantsController < ApplicationController
        skip_before_action :verify_authenticity_token
        def index 
          @patiants=Patiant.all
              render json: @patiants
        end
        def new
          @patiants=Patiant.new
        end
        def show
          @patiants = Patiant.find(params[:id])
          render json: @patiants
        end             
        def destroy
          begin
                    @patiants = Patiant.find(params[:id])
              @patiants.destroy
              render json: { message: "Employee was successfully deleted." }, status: :ok
          rescue ActiveRecord::RecordNotFound
              render json: { message: "Employee not found." }, status: :not_found
          end
      end
        def create
          @patiants = Patiant.new(user_params)    
          if @patiants.save
            render json: @patiants
          else 
            render json: {message: "Check your entry"}, status: :unprocessable_entity
          end
        end
      private
        def user_params
          params.require(:patiants).permit(:name, :doctor)
        end
      end

