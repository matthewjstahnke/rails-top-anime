class SessionsController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]

    def signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :signup
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end


end