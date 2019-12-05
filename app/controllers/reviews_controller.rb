class ReviewsController < ApplicationController
  DISCOVER = ["Dans une librarire", "Emission de TV", "Magazine", 'Conseil', "Mybooks & me" ]

  def new
    @reading = Reading.find(params[:id])
    @review = Review.new
    @review.reading_id = @reading
    @discover = DISCOVER
  end

  def create

    @review = Review.new
    @review.user = current_user
    @review.reading_id = Reading.find(params[:id])


  end

  def destroy
    @review.destroy

    redirect_to book_show_path
  end

  def consult
    @reading= Reading.find(params[:id])
  end
end
