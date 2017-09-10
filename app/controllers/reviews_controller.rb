class ReviewsController < ApplicationController
	 def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @room = Room.all
    #binding.pry
    if @review.save
    	#binding.pry
      redirect_to :back, notice: "Thank you for the Review"
  else 
  	redirect_to room_path(@room.ids)
    end
  end
  
  def show
  end

  def destroy
      @review = Review.find(params[:id])
      #binding.pry
      if @review.destroy
        redirect_to :back, notice: "successfully deleted"
      else
        render action: back
      end
    end
  
  private
  def review_params
    params[:review].permit(:review, :food_rating, :cleanliness_rating, :safety_rating, :facility_rating, :locality_rating, :user_id, :room_id)
  end

end
