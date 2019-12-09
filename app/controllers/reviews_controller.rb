class ReviewsController < ApplicationController
  DISCOVER = ["Dans une librarire", "Emission de TV", "Magazine", 'Conseil', "Mybooks & me" ]



  def new
    @reading = Reading.find(params[:id])

    @discover = DISCOVER
  end

  def view
    @reading = Reading.find(params[:id])
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
    @reading.update(indice: calc_indice(@reading.notation))

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
    @livreactuel = Reading.find(params[:id]).livre

    @liste = Reading.where(livre_id: @livreactuel.id)
    @tag = Reading.find(params[:id]).tags
    @liste = @liste[0..-2]


  end


  private

  def calc_indice(note)
    notations = note.split('/')
    nb = notations.size-1
    diviseur = 100.0 / nb
    n = notations[0..-2]
    n.map! do |item|
      item.to_i * diviseur / 10
    end
    m1 = (n.sum / nb)  * 40.0
    m2 = notations[-1].to_i * 60.0
    moy = ((m1 + m2) / 20.0).round(2)

  end
end
