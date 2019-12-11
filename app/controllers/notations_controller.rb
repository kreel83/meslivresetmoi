
class NotationsController < ApplicationController
  def index


    @reading = Reading.find(params[:id])
    tag = @reading.tags[0].name
    @taglist = Critere.tagged_with(tag)


  end


  def consult
    if params[:status] == 'liste'
      @livre = Livre.find(params[:id])

    else
      @livre = Reading.find(params[:id]).livre
    end
    @readings = Reading.where(livre: @livre).where(status: 'done')

    @readings = @readings.sort_by {| item | item.indice}.reverse if !@readings.empty?

  end

  def view

    @other_reading = Reading.find(params[:id])
    @other_notes = @other_reading.notation.split('/')


    livre = @other_reading.livre
    @my_reading = Reading.where(user: current_user).where(livre: livre)[0]
    if !@my_reading.notation.nil?
      @my_notes = @my_reading.notation.split('/')
    end

  end


end
