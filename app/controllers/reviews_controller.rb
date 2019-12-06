class ReviewsController < ApplicationController
  DISCOVER = ["Dans une librarire", "Emission de TV", "Magazine", 'Conseil', "Mybooks & me" ]



  def new
    @reading = Reading.find(params[:id])
    @review = Review.new
    @discover = DISCOVER
  end

  def create

    @review = Review.new
    @review.status = false

    @review.status = true if params[:status]
    @review.comment = params[:commentaire]
    @review.feeling = params[:feeling]
    @review.discover = params[:discover]
    @review.reading = Reading.find(params[:id])
    @review.save!
    redirect_to books_path

  end

  def comment
    @reading = Reading.find(params[:id])
    @reading.update(status: 'done')

      if params[:status] == 'true'
        redirect_to new_review_path(@reading)
      else
        redirect_to books_path
      end
    end

    def destroy
      @review.destroy

      redirect_to book_show_path
    end

    def consult
      @reading= Reading.find(params[:id])
    end
  end
