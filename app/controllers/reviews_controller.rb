class ReviewsController < ApplicationController
    before_action :find_anime,:find_review, only: [:new, :show, :edit, :update, :destroy]
    


    def show
        @anime = Anime.find(params[:anime_id])
        @review = Review.find(params[:id])
        redirect_if_not_owner 
    end

    def new
        @anime = Anime.find(params[:anime_id])
        @review = @anime.reviews.build
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to anime_review_path(params[:anime_id], @review)
        else
            render :new
        end
    end

    def edit        
        @review = Review.find(params[:id])
        @anime = Anime.find(params[:anime_id])
        redirect_if_not_owner     
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to anime_path(@review.anime_id)
    end

    def destroy
        @review = Review.find(params[:id])
        @anime = Anime.find(params[:anime_id])
        @review.destroy
        flash[:notice] = "#{@review.comment} was deleted."
        redirect_to anime_path(@review.anime_id)
    end

    private

        def review_params
            params.require(:review).permit(:comment,:user_id,:anime_id)
        end

        def redirect_if_not_owner
            redirect_to animes_path(@anime) unless @review.user_id == current_user.id
        end

        def redirect_if_not_exist
            redirect_to egg_path unless @review
        end
end
