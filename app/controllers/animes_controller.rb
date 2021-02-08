class AnimesController < ApplicationController
    before_action :find_anime, only: [:show, :edit, :update, :destroy]

    def index
        @animes = Anime.all
    end

    def show
    end

    def new
        @anime = Anime.new
    end

    def create
    params
        @anime = Anime.new(anime_params)
        if @anime.save
            redirect_to animes_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @anime.update(anime_params)
            redirect_to anime_path(@anime)
        else
            render :edit
        end
    end

    def destroy
        @anime.destroy
        redirect_to animes_path
    end

    private

        def find_anime
            @anime = Anime.find_by_id(params[:id])
        end

        def anime_params
            params.require(:anime).permit(:title, :genre, :release_year, :episode_count)
        end
end

