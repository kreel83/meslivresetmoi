require 'json'
require 'open-uri'

class SearchsController < ApplicationController
  def index
    params[:title] = nil if params[:title] == ''
    params[:author] = nil if params[:author] == ''

    if params[:title].nil? && params[:author].nil?
      @fj = []
    else
      title = params[:title].gsub(' ', '+') unless params[:title].nil?
      author = ERB::Util.url_encode(params[:author])
      title = '' unless params[:title]
      if title != ''
        title_text = "intitle:#{title}"
      else
        title_text = ''
      end
      author_text = "+inauthor:\"#{author}\"" if author != ''

      index = 0
      continue = true
      @total = []
      while continue
        url = "https://www.googleapis.com/books/v1/volumes?q=#{title_text}#{author_text}&maxResults=40&orderBy=newest&langRestrict=fr&startIndex=#{index}"
        index += 40
        f = open(url).read
        fj = JSON.parse(f)
        @fj = fj['items']

        continue = false unless @fj.size == 39

        if @fj.nil?
          @fj = []
        else
          titles = []
          @tab=[]
          @fj.each do |item|
            unless item['volumeInfo']['authors'].nil?
              unless titles.include? item['volumeInfo']['title'].downcase
                @tab << item
                titles << item['volumeInfo']['title'].downcase
              end
            end
          end
          #@tab.sort_by! { |tab| tab['volumeInfo']['title'].downcase }
          @fj = @tab
        end
        @authors = []
        @fj.each do | auth |
          auteur = auth['volumeInfo']['authors']
          i = auteur.find_index { |item| item.gsub('.', '').downcase.include? params[:author].downcase }
          if i
          @authors << auteur[i] unless @authors.map { |s| s.downcase }.include? auteur[i].sub('.', '').downcase
        end
        end
        @total << @fj
      end

    end
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
