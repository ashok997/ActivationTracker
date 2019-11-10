class CarriersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def new
        @carrier = Carrier.new
    end
    
    def create
        @carrier = Carrier.new(carrier_params)
        if @carrier.save
            redirect_to carriers_path
        else
            render :new
        end
    end

    def index
        @carriers = Carrier.all
    end

    def carrier_params
        params.require(:carrier).permit(:name, :cost, :rating )
    end

end
