class PhonesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def new
        @phone = Phone.new
    end

    def show
        @phone = Phone.find_by_id(params[:id])
    end
    def index
        @phones = Phone.all
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
