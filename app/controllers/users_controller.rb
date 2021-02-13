class UsersController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username:params[:username])
        if !@user
            login_error
            render :new
        elsif !@user.authenticate(params[:password])
            login_error
            render :new
        else
            session[:user_id] = @user.id
            redirect_to root_path
        end
    end

    private
        def login_error
            flash.now[:notice] = "Username or Password is incorrect."
        end
end