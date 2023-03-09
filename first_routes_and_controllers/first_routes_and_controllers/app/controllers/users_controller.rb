class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end 

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        incoming_wildcard = params[:id]
        answer = User.find_by(id:incoming_wildcard)
        if !answer
            render json: "User not found"
        else
            render json: answer
        end
    end

    def update
        incoming_wildcard = params[:id]
        located_user = User.find_by(id:incoming_wildcard)
        if !located_user 
            render json: "User not found"
        elsif !located_user.update!(user_params)
            render json: located_user.errors.full_messages, status: :unprocessable_entity 
        else
            redirect_to user_url(located_user.id)   
        end
    end

    def destroy
        incoming_wildcard = params[:id]
        located_user = User.find_by(id:incoming_wildcard)
        # dupe_user = located_user.dup
        if !located_user 
            render json: "User not found"
        else
            # redirect_to user_url(located_user.id)
            located_user.destroy
            render json: located_user
        end

    end


    private 
    def user_params
        params.require(:user).permit(:username)
    end
end