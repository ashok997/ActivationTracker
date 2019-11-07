class ActivationsController < ApplicationController

    def index
    end

    def show
    end

    def new
        @activation =Activation.new
    end

    def create
        @activation = Activation.new(activation_params)
    end

    def activation_params
        params.require(:activation).permit(:phone_number, :IMEI, :phone_id, :carrier_id)
    end
    
end
