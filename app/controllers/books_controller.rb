class BooksController < ApplicationController
  def index
    @ec = Reading.where(status: 'ec')
    @wl = Reading.where(status: 'wl')
    @done = Reading.where(status: 'done')

  end

  def show
    @reading = Reading.find(params[:id])

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

  def show
    #@book = Book.find(params[:id])
  end
end
