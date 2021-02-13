class AnimesController < ApplicationController
    before_action :find_anime, only: [:show, :edit, :update, :destroy]
    

    def index
        if params[:sort] == "title"
            @animes = Anime.anime_sort(params[:sort])
        elsif params[:sort] == "release_year"
            @animes = Anime.anime_sort(params[:sort])
        elsif params[:sort] == "episode_count"
            @animes = Anime.anime_sort(params[:sort])
        elsif params[:sort] == "genre"
            @animes = Anime.anime_sort(params[:sort])
        else
            @animes = Anime.all
        end
    end

    def show       
    end

    def new
        @anime = Anime.new
    end

    def create
    params
        @anime = current_user.animes.build(anime_params)
        if @anime.save
            redirect_to animes_path
        else
            anime_errors
            render :new
        end
    end

    def edit
    end

    def update
        if @anime.update(anime_params)
            redirect_to anime_path(@anime)
        else
            anime_errors
            render :edit
        end
    end

    def destroy
        @anime.destroy
        flash[:notice] = "#{@anime.title} was deleted."
        redirect_to animes_path
    end

    private

        def anime_errors
            flash.now[:error] = @anime.errors.full_messages
        end

        def anime_params
            params.require(:anime).permit(:title, :genre, :release_year, :episode_count,:user_id)
        end
end

