class UsersController < ApplicationController

    def index 
        user = User.all
        render json: user
    end

    #check to see if current_user(defined in the controller) is returning a currently logged in user. THis is to ensure that our user does not need to follow authentication agian
    def show 
        if current_user
            render json: current_user, status: :ok
        else
            render json: "No current session stored", status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id  #keeps track of the new user and logs our user in
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
    end

    def destroy
    end

    def user_params
        params.permit(:username,:email, :password)
    end

end
