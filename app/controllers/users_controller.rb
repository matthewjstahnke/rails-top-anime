class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username:params[:username])
        if !@user
            render :new
        else
            session[:user_id] = @user.id
            redirect_to root_path
        end
    end

end