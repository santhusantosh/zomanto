class ReviewsController < ApplicationController

	before_action :authenticate_user!

	def create
		@review=Review.new(review_params)
		@review.user_id=current_user.id
		if @review.save
			redirect_to :back,notice:"Thank You for the review"
		end
	end


	private

	def review_params
		params[:review].permit(:title,:body,:rating,:restaurant_id)
	end
end
