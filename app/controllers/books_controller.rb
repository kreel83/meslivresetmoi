class BooksController < ApplicationController
  def index
    @ec = Reading.where(status: 'ec')
    @wl = Reading.where(status: 'wl')
    @done = Reading.where(status: 'done')
    @el = Endinglist.all
  end

  def show
    @reading = Reading.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all.order(:name)
    if @reading.livre.tags == []
      @tag = []
    else
      @tag = @reading.livre.tags[0].name
    end
  end

  def update_tag
    book = Livre.find(params[:id])
    book.tags.each do |tag|
      book.tag_list.remove(tag.name)
    end
    book.tag_list.remove("awesome", "slick")
    book.tag_list.add(params[:cat])

    book.save
    render json: {status: params}
  end

  def update
    r = Reading.find(params[:id])
    status = r.status
    if status == 'wl'
      r.update(status: 'ec')
    end
    if status == 'ec'
      r.update(status: 'done')
    end
    redirect_to books_path
  end

  def update_notation

    r = Reading.find(params[:id])
    r.update(notation: params[:note])
    render json: {status: params}

  end


  def destroy
    Reading.destroy(params[:id])
    redirect_to books_path

  end


end
