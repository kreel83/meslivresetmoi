class AdminsController < ApplicationController

  def index
    @total = []
    @endinglists = Endinglist.all
    @endinglists.each  do |list|
      theme={}
      theme['liste'] = list.id.to_s
      theme['livres'] = Ending.where(endinglist_id: list).order(created_at: :DESC)
      @total << theme
    end
    @select = params[:id] || nil
  end


  def delete

        Ending.find(params[:id]).destroy
        render json: {data: params[:id]}
  end


  def add

    redirect_to search_path(status: params[:status])

  end

  def store
    id = params[:status].gsub('liste','').to_i
      search = Livre.find_by(googleid: params[:googleid])

      if search.nil?
      url = "https://www.googleapis.com/books/v1/volumes/#{params[:googleid]}"
      f = open(url).read
      fj = JSON.parse(f)

      l = Livre.new
      l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
      l.title =  fj['volumeInfo']['title']
      l.description = fj['volumeInfo']['description']
      l.author = fj['volumeInfo']['authors'].join(', ')
      l.googleid = params[:dataId]
      l.save!
    else
      l = search
    end
    ending = Ending.new
    ending.endinglist_id = id
    ending.livre = l
    ending.save!
    redirect_to admin_path(id: id)

  end

  def storeListe
    Endinglist.create(name: params[:addliste])
    redirect_to admin_path(id: params[:addliste])


  end
end
