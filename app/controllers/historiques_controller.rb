class HistoriquesController < ApplicationController
  def index
    @historique = Reading.where(user: current_user).where(status: 'done')
    @historique = @historique.sort_by {|read| read.startdate }.reverse
    # @historique = @historique.sort_by &:updated_at
    l = @historique.first.updated_at.year
    @tab = []
    annee= {}

    annee[:date] = l
    annee[:livre] = []
        annee[:livre] = inputmonth(annee[:livre])

    @historique.each do |reading|

      if reading.startdate.year == l
        m = reading.startdate.month

        annee[:livre][m-1][:book] << reading
      else
        l = reading.startdate.year
        @tab << annee
        annee = {}
        annee[:date] = l
        annee[:livre] = []
        annee[:livre] = inputmonth(annee[:livre])
        m = reading.startdate.month

        annee[:livre][m-1][:book] << reading
      end


    end
@tab << annee


  end

  private

  def inputmonth(arr)
    months = %w(janvier fevrier mars avril mai juin juillet aout septembre octobre novembre decembre)
    colors = %w(#FFF82A #FFA81E #FF8E8E #FF5CF5 #8C70FF #5CA4FF #8CFFE9 #0040FF #4AFF49 #FFFFFF #FF00BF #FF4B4B)
    months.each_with_index do |month, index|
      m={}
      m[:month] = month
      m[:color] =  colors[index]
      m[:book] = []
      arr <<  m
    end
    arr
  end
end
