class ReviewsController < ApplicationController
	 def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to :back, notice: "Thank you for the Review"
    end
  end
  private
  def review_params
    params[:review].permit(:review, :food_rating, :cleanliness_rating, :safety_rating, :facility_rating, :locality_rating, :user_id, :room_id)
  end
  def show
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to room_path(@review.room_id)
    end
  end

end
