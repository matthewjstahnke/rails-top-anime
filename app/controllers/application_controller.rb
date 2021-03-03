class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :fallback
    helper_method  :current_user, :logged_in?

    def fallback
        redirect_to egg_path
    end

    private 

    def current_user
        User.find(session[:user_id]) 
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def find_anime
        @anime = Anime.find_by_id(params[:id])
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end

    def redirect_if_not_logged_in
        redirect_to new_user_path unless logged_in?
    end



end
