class ActivationsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def index
        @users = User.all
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
        redirect_if_not_logged_in
        if params[:phone_id] && @phone = Phone.find_by_id(params[:phone_id])
            @activation = @phone.activations.new
        else
            @activation =Activation.new
        end
    end

    def create
        redirect_if_not_logged_in
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
