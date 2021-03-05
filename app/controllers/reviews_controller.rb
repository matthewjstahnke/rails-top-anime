class ReviewsController < ApplicationController
    before_action :find_anime_nest,:find_review, only: [:new, :show, :edit, :update, :destroy]
    before_action :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
    
    def show
    end

    def new
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
    end

    def update
        @review.update(review_params)
        redirect_to anime_path(@review.anime_id)
    end

    def destroy
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
end
