class ReviewsController < ApplicationController
  def index
    @reading= Reading.find(params[:id])
  end

  def consult
    @reading= Reading.find(params[:id])
  end
end
