class ListesController < ApplicationController

  def show
    @reading = Ending.find(params[:id])

  end


def update
  @ending = Ending.find(params[:id])
  @reading = Reading.new
  @reading.status = 'wl'
  @reading.user = current_user
  @reading.livre = @ending.livre
  @reading.save!
  redirect_to books_path
end
end
