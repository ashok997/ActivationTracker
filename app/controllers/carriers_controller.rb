class CarriersController < ApplicationController
    def new
        @carrier = Carrier.new
    end
    
    def create
        @phone = Phone.new(phone_params)
        if @phone.save
            redirect_to phones_path
        else
            render :new
        end
    end

    def phone_params
        params.require(:phone).permit(:model, :manufacturer, :storage )
    end
end
