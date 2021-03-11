class ReviewerController < ApplicationController
    def index     
        find_anime_nest
        @users = User.all
    end
end