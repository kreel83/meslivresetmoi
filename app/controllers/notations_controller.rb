
class NotationsController < ApplicationController
  def index


    @reading = Reading.find(params[:id])
    tag = @reading.livre.tags[0].name
    @taglist = Critere.tagged_with(tag)


  end


  def consult
    @faker = [
      {
        id: 1,
        avatar: "",
        name: "Gisèle R.",
        date: "3 février 1999",
        indice: 945,
        commentaire: true
      },
      {
        id: 2,
        avatar: "",
        name: "Alexandre B.",
        date: " 6 novembre 2003",
        indice: 934,
        commentaire: false
      },
      {
        id: 3,
        avatar: "",
        name: "Mohamed T",
        date: "5 janvier 2004",
        indice: 812,
        commentaire: true
      },
      {
        id: 4,
        avatar: "",
        name: "Caroline S.",
        date: "8 mars 1999",
        indice: 745,
        commentaire: true
      },
      {
        id: 5,
        avatar: "",
        name: "Damein B.",
        date: " 15 avril 2004",
        indice: 633,
        commentaire: false
      },
      {
        id: 6,
        avatar: "",
        name: "Justine T",
        date: "5 octobre 2016",
        indice: 630,
        commentaire: true
      },
      {
        id: 7,
        avatar: "",
        name: "Stephane R.",
        date: "3 decembre 1998",
        indice: 560,
        commentaire: true
      },
      {
        id: 8,
        avatar: "",
        name: "Billel B.",
        date: "18 juillet 2010",
        indice: 515,
        commentaire: false
      },
      {
        id: 9,
        avatar: "",
        name: "Anthony T",
        date: "5 janvier 2004",
        indice: 498,
        commentaire: true
      },
    ]

@tag = ['charisme des personnages', "qualité de l'intrigue", "immersion"]

  end
end
