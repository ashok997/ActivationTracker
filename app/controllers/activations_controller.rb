class ActivationsController < ApplicationController

    def index
        @activations = Activation.all
    end

    def show
        @activation = Activation.find(params[:id])
    end

    def new
        @activation =Activation.new
    end

    def create
        @activation = Activation.new(activation_params)
        if @activation.save
            redirect_to activations_path(@activation)
        else
            render :new
        end
    end

    def activation_params
        params.require(:activation).permit(:phone_number, :IMEI, :phone_id, :carrier_id, :user_id)
    end
    
end
