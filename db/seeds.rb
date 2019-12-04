# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActsAsTaggableOn::Tag.destroy_all
ActsAsTaggableOn::Tag.create(name: "Sciences fictions", color: "#F4C323")
ActsAsTaggableOn::Tag.create(name: "Heroic Fantasy", color: "#FF68AB")
ActsAsTaggableOn::Tag.create(name: "Livre de voyages", color: "#FF68AB")
ActsAsTaggableOn::Tag.create(name: "Roman XXeme siècle", color: "#9686FF")
ActsAsTaggableOn::Tag.create(name: "Roman US", color: "#86D3FF")
ActsAsTaggableOn::Tag.create(name: "Roman étranger", color: "#6FFF84")
ActsAsTaggableOn::Tag.create(name: "Policier", color: "#F4FFE8")
ActsAsTaggableOn::Tag.create(name: "Thriller", color: "#0040FF")
# tableau d'id google

Critere.destroy_all
c = Critere.new(name: 'Charisme des personnages')
c.tag_list = "Sciences fictions,Roman étranger,Roman US"
c.save
c = Critere.new(name: 'Immersion')
c.tag_list = "Sciences fictions,Thriller"
c.save
c = Critere.new(name: 'Sens du rythme')
c.tag_list = "Sciences fictions,Roman étranger, Heroic Fantasy"
c.save
c = Critere.new(name: "Qualité de l'intrigue")
c.tag_list = "Livre de voyages,Roman étranger,Roman US"
c.save
c = Critere.new(name: 'Style')
c.tag_list = "Sciences fictions,Roman étranger,Heroic Fantasy"
c.save
c = Critere.new(name: 'Niveau de peur')
c.tag_list = "Sciences fictions,Roman XXeme siècle, Roman US"
c.save
c = Critere.new(name: "Description de l'univers")
c.tag_list = "Heroic Fantasy,Roman étranger"
c.save

puts 'done'




# liste = ["DSOyDwAAQBAJ", "MZmxDwAAQBAJ", "LEC1DwAAQBAJ", "DRe9DwAAQBAJ", "EH1oDwAAQBAJ", "HtPHtAEACAAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|

#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Nouveautés Romans'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5
# end


# puts "Nouveautés roman done"
# sleep 20



# liste = ["FKeVDgAAQBAJ", "4eeGAQAAQBAJ", "OIarDgAAQBAJ", "Gpe4DwAAQBAJ", "USWJAQAAQBAJ", "35Z7DAAAQBAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|

#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Fantaisie'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5
# end

# puts "Fantaisie done"



# liste = ["AyOyDwAAQBAJ", "VvqzDwAAQBAJ", "1fa2DwAAQBAJ", "5j6uDwAAQBAJ", "odjHDgAAQBAJ", "Foe5DwAAQBAJ", "5ZyuDwAAQBAJ", "zrexDwAAQBAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|

#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Nouveautés Polar Suspense'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5
#   puts book+' done'
# end
# puts "Nouveautés Polar Suspense done"



# liste = ["ieDBAgAAQBAJ", "njARDQAAQBAJ", "FQtHBAAAQBAJ", "ThihCgAAQBAJ", "leASDgAAQBAJ", "1khmDwAAQBAJ", "QqVyDwAAQBAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|

#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Historique'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5
# end

# puts "Historique done"




# liste = ["pgMmAgAAQBAJ", "Qs0QCwAAQBAJ", "PZaGAQAAQBAJ", "3QpMAAAAcAAJ", "Ck6TqBtR8qAC", "K8Gonq72BgEC", "T9JBAAAAcAAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|
#   puts book
#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Horreur'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5
# end

# puts "Horreur done"



# liste = ["3QpMAAAAcAAJ", "O1BSCwAAQBAJ", "TWKQPwAACAAJ", "Q3WZbrFB8asC", "oE51xwEACAAJ", "lW4zDQAAQBAJ"]

# Endinglist.destroy_all
# Ending.destroy_all

# liste.each do |book|

#   url = "https://www.googleapis.com/books/v1/volumes/#{book}&key=yAIzaSyD6eGVbzOmMiwoP9UivZ5pI1gnhyAz-n3s"
#   f = open(url).read
#   fj = JSON.parse(f)
#   l = Livre.new

#   l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
#   l.title =  fj['volumeInfo']['title']
#   l.description = fj['volumeInfo']['description']
#   l.author = fj['volumeInfo']['authors'].join(', ')
#   l.googleid = book
#   l.save!
#   el = Endinglist.new
#   el.name = 'Science fictions'
#   el.save

#   ending = Ending.new
#   ending.livre = l
#   ending.endinglist = el
#   ending.save!
#   sleep 5

# end

# puts "Science fictions done"


