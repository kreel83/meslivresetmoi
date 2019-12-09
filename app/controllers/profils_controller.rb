class ProfilsController < ApplicationController
  def show

    @profilowner = User.find(params[:user])

    @readings = Reading.where(user: @profilowner).where(status: "done")
    @actual = Reading.where(user: @profilowner).where(status: "ec")[0]
    @top = @readings.sort_by {|item| item.indice}.reverse.first(10)

  end
end
