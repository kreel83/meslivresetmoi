class ProfilsController < ApplicationController
  def show
    @done = Reading.where(status: 'done').where(user: current_user)
    @done.each do |book|
      link_to book_show_path(book, status: status) do
        image_tag book.livre.imageurl
      end
    end
  end
end
