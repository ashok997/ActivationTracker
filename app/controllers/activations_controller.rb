class ActivationsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def index
        @users = User.all
        @carriers = Carrier.all

        if !params[:user].blank? && !params[:carrier].blank?
            @activations = Activation.by_user(params[:user]).with_carrier(params[:carrier])
        elsif !params[:user].blank?
            @activations = Activation.by_user(params[:user])
        elsif !params[:carrier].blank?
            @activations = Activation.with_carrier(params[:carrier])
        else
            @activations = Activation.all
        end
    end

    def show
        @activation = Activation.find_by_id(params[:id])
        if !@activation
            flash[:message]= "Activation you are looking for does not exits!!" 
            redirect_to '/' 
        end
    end

    def new
        if params[:phone_id] && @phone = Phone.find_by_id(params[:phone_id])
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
