class BooksController < ApplicationController
  def index
    @ec = Reading.where(status: 'ec')
    @wl = Reading.where(status: 'wl')
    @done = Reading.where(status: 'done')

  end

  def show

    @reading = Reading.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
    @tag = @reading.livre.tags[0].name

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
    redirect_to books_index_path
  end




  def destroy
    Reading.destroy(params[:id])
    redirect_to books_index_path

  end


end
