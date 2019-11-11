class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def edit
        @user = User.find_by_id(params[:id])
        if session[:user_id] == @user.id
            render :edit
        else
            flash[:message]= "You do not have permission to make this change"
            redirect_to '/'
        end
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

    def destroy
        if session[:user_id] == @user.id
            @user = User.find_by_id(params[:id]).destroy
            redirect_to '/'
        else
            flash[:message]= "You do not have permission to make this change"
            redirect_to '/'
        end
        
    end

    def update
        user = User.find_by_id(params[:id])
        user.update(user_params)
        binding.pry
        redirect_to user_path(user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end
end
