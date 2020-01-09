class AdminsController < ApplicationController

  def index
    @total = []
    @endinglists = Endinglist.all
    @endinglists.each  do |list|
      theme={}
      theme['liste'] = list.id.to_s
      theme['livres'] = Ending.where(endinglist_id: list)
      @total << theme
    end
  end
end
