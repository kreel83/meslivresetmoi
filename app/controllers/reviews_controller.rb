class ReviewsController < ApplicationController
  DISCOVER = ["Dans une librarire", "Emission de TV", "Magazine", 'Conseil', "Mybooks & me" ]



  def new
    @reading = Reading.find(params[:id])

    @discover = DISCOVER
  end



  def create
    @reading = Reading.find(params[:id])

    @reading.public = false

    @reading.public = true if params[:status]
    @reading.comment = params[:commentaire]
    @reading.feeling = params[:feeling]
    @reading.discover = params[:discover]

    @reading.save!
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
