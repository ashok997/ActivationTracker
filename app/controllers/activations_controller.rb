class ActivationsController < ApplicationController

    def index
        @users = User.all
        #binding.pry
        if params[:user]
            @activations = Activation.by_user(params[:user])
        else
            @activations = Activation.all
        end
    end

    def show
        @activation = Activation.find(params[:id])
    end

    def new
        if params[:phone_id]
            @phone = Phone.find_by_id(params[:phone_id])
            @activation = @phone.activations.new
        else
            @activation =Activation.new
        end
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
