class ProfilsController < ApplicationController
  def show
    @profilowner = User.find(param[:user])
  end
end
