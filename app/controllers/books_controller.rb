class BooksController < ApplicationController
  def index
    @ec = Reading.where(status: 'ec').where(user: current_user)
    @wl = Reading.where(status: 'wl').where(user: current_user)
    @done = Reading.where(status: 'done').where(user: current_user).order(startdate: :desc).first(10)
    @liste = Reading.where(status: 'liste').where(user: current_user)

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

  def update_like
    id = params[:id]
    like = params[:act]
    r = Reading.find(id)
    if like == 'like'
      c = r.like.to_i + 1
      r.update(like: c)
    else
      c = r.unlike.to_i + 1
      r.update(unlike: c)
    end

    render json: {add: c, id: id, like: like}
  end

  def update
    r = Reading.find(params[:id])

    status = r.status
    if status == 'wl'
      r.update(status: 'ec')
    end
    if status == 'ec'
      r.update(startdate: Date.today)

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
