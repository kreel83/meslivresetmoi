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
      if params[:status] != 'liste'
        @tag = Reading.find(params[:id]).tags
      else
        @tag = @liste.first.tags
      end
      @liste = @liste.reject {|item| item.comment.nil? }
      @liste = @liste.sort_by {|item | item.startdate }.reverse
    end
  end


  private

  def calc_indice(note)
    notations = note.split('/')
    nb = notations.size-1
    n = notations[0...-1]

    n.map! {|item| item.to_i}
    somme = n.sum
    m1 = (somme / nb)  * 0.4
    m2 = notations[-1].to_i * 0.6
    moy = ((m1 + m2) * 10).round(2)

  end
end
