class ReviewsController < ApplicationController
  DISCOVER = ["Dans une librairie", "Emission de TV", "Magazine", "Conseil", "My Books & Me"]

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

    if @reading.notation.nil?
      redirect_to notations_path(@reading)
    else
    @reading.update(status: 'done')
    @reading.update(startdate: Date.today)
    @reading.update(indice: calc_indice(@reading.notation))

    if params[:status] == 'true'
      redirect_to new_review_path(@reading)
    else
      redirect_to books_path
    end
  end
  end

  def destroy
    @review.destroy

    redirect_to book_show_path
  end

  def consult
    if params[:status] != 'liste'
      @livreactuel = Reading.find(params[:id]).livre
    else
      @livreactuel = Livre.find(params[:id])
    end

    @liste = Reading.where(livre_id: @livreactuel.id)
    if @liste.empty?
      @tag = []

    else
      @tag = Reading.find(params[:id]).tags
      @liste = @liste.reject {|item| item.comment.nil? }
      @liste = @liste.sort_by {|item | item.startdate }.reverse
    end
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
