class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def index
        @users = User.all 
        
    end

    def show
        find_anime
        @user = User.find(params[:id])
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