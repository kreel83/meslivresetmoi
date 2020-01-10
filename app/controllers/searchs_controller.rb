require 'json'
require 'open-uri'

class SearchsController < ApplicationController
  def index
    params[:title] = nil if params[:title] == ''
    params[:author] = nil if params[:author] == ''

    if params[:title].nil? && params[:author].nil?
      @fj = []
      @total = []
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
      @authors = []
      while continue
        url = "https://www.googleapis.com/books/v1/volumes?q=#{title_text}#{author_text}&maxResults=40&orderBy=newest&langRestrict=fr&startIndex=#{index}"
        index += 40
        f = open(url).read
        fj = JSON.parse(f)
        @fj = fj['items']



        if @fj.nil?
          @fj = []
          continue = false
        else
          @fj = @fj.reject {|f| f['volumeInfo']['imageLinks'].nil? }
          continue = false unless @fj.size == 39
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

        @fj.each do | auth |
          auteur = auth['volumeInfo']['authors']

          if params[:author]
            i = auteur.find_index { |item| item.gsub('.', '').downcase.include? params[:author].downcase }
          else
            i = 0
          end
          if i
            @authors << auteur[i] unless @authors.map { |s| s.gsub(/[\.\s]/, '').downcase }.include? auteur[i].gsub(/[\.\s]/, '').downcase
          end

        end
        @total << @fj

      end
      # a = @authors[1]
      # aa = a.split(' ')
      # aa.map! {| m | m.downcase.capitalize }
      # t = aa.join('_')
      # url = "https://fr.wikipedia.org/wiki/#{t}"

    end

  end

  def store
    status = params[:status]
    session['search'] = params[:dataId]


    if status.include? 'liste'
      redirect_to admin_liste_store_path(googleid: params[:dataId], status: params[:status])
      return
    end

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
