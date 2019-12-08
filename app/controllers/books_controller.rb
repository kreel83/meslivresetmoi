class BooksController < ApplicationController
  def index
    @ec = Reading.where(status: 'ec')
    @wl = Reading.where(status: 'wl')
    @done = Reading.where(status: 'done')
    @liste = Reading.where(status: 'liste')




    @el = Endinglist.all
  end

  def show
    @status = params[:status]
    if @status === "liste"
      redirect_to liste_show_path(params[:id])
    else

    @reading = Reading.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all.order(:name)

    if params[:status] == 'done'
      @notes = @reading.notation.split('/')
      tag = @reading.tags[0].name
      @crit = Critere.tagged_with(tag)
      @criteria = []
      @crit.each_with_index do |critere, index|
        @couple = []
        @couple << critere.name
        @couple << @notes[index]
        @criteria << @couple
      end
    else
      @notes = []
      @criteria = []
    end

    if @reading.tags == []
      @tag = []
    else
      @tag = @reading.tags[0].name
    end
  end
  end

  def update_tag
    reading = Reading.find(params[:id])
    reading.tags.each do |tag|
      reading.tag_list.remove(tag.name)
    end

    reading.tag_list.add(params[:cat])
    @tag = params[:cat]
    reading.save

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
