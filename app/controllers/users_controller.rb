class UsersController < ApplicationController

    skip_before_action :authenticate_user, only: [:index, :destroy, :create, :show]

    def index 
        user = User.all
        render json: user, status: 200
    end

    #Signup
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id  #keeps track of the new user and logs our user in
        render json: user, status: :created
    end

     #check to see if current_user(defined in the controller) is returning a currently logged in user. THis is to ensure that our user does not need to follow authentication agian
     def show 
        if current_user
            render json: current_user, status: :ok
        else
            render json: "No current session stored", status: :unauthorized
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end

end
