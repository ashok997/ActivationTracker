class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        if !@user
            flash[:message]= "User you are looking for does not exits!!" 
            redirect_to '/' 
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end
end
