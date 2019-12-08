require 'json'
require 'open-uri'


class SearchsController < ApplicationController
  def index
    title = ERB::Util.url_encode(params[:title])
    author = ERB::Util.url_encode(params[:author])

    title = '' if !params[:title]
    author = ERB::Util.url_encode('grangé') if !params[:author]

    titleText = "q=#{title}"
    authorText = "+inauthor:#{author}" if author != ''

    url = "https://www.googleapis.com/books/v1/volumes?#{titleText}#{authorText}&langRestrict=fr&maxResults=40"

    f = open(url).read
    fj = JSON.parse(f)
    @fj = fj['items']
    last = ''
    @tab = []
    @fj.each do |item|
      @tab << item  if last != item['volumeInfo']['title']
      last = item['volumeInfo']['title']
    end

    @fj = @tab


  end

  def store
    status = params[:status]
    session['search'] = params[:dataId]


      search = Livre.where(googleid: params[:dataId])
      if search == []
      url = "https://www.googleapis.com/books/v1/volumes/#{params[:dataId]}"
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
        l = search[0]
      end

      r = Reading.new
      r.livre = l
      r.user = current_user
      r.status = params[:status]
      if params[:status] == 'wl'
        r.startdate = Date.today
      end
      if params[:status] == 'ec'
        r.enddate = Date.today
      end
      r.save!



    redirect_to books_path
  end

  private


end

