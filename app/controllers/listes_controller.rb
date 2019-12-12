class ListesController < ApplicationController

  def show
    if params[:status] == 'follow'
      @livre = Livre.find(params[:id])

    else
    @livre = Ending.find(params[:id]).livre

  end

  end


def update
  @livre = Livre.find(params[:id])
  @reading = Reading.new
  @reading.status = 'wl'
  @reading.user = current_user
  @reading.livre = @livre
  @reading.save!
  redirect_to books_path
end
end
