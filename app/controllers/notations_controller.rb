
class NotationsController < ApplicationController
  def index

    @reading = Reading.find(params[:id])
    tag = @reading.livre.tags[0].name
    @taglist = Critere.tagged_with(tag)


  end
end
