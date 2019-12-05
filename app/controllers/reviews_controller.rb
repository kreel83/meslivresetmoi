class ReviewsController < ApplicationController
  def new
    @reading = Reading.find(params[:id])
    @review = Review.new
    @review.reading_id = @reading
  end

  def create
    @review = Review.new
    @review.user = current_user
    @review.reading_id = Reading.find(params[:id])

    # if @review.status == false

    # else

    # end
  end

  def destroy
    @review.destroy

    redirect_to book_show_path
  end
end
