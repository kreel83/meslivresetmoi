
class NotationsController < ApplicationController
  def index


    @reading = Reading.find(params[:id])
    tag = @reading.tags[0].name
    @taglist = Critere.tagged_with(tag)


  end


  def consult
    @livre = Reading.find(params[:id]).livre
    @readings = Reading.where(livre: @livre)
    @readings = @readings.sort_by {| item | item.indice}.reverse
  end

  def view

    @other_reading = Reading.find(params[:id])
    @other_notes = @other_reading.notation.split('/')

    livre = @other_reading.livre
    @my_reading = Reading.where(user: current_user).where(livre: livre)[0]
    @my_notes = @my_reading.notation.split('/')

  end


end
