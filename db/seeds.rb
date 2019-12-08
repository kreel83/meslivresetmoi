# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



def calc_indice(note)
  notations = note.split('/')
  nb = notations.size-1
  diviseur = 100.0 / nb
  n = notations[0..-2]
  n.map! do |item|
    item.to_i * diviseur / 10
  end
  m1 = (n.sum / nb)  * 40.0
  m2 = notations[-1].to_i * 60.0
  moy = ((m1 + m2) / 20.0).round(2)

end

DISCOVER = ["Dans une librarire", "Emission de TV", "Magazine", 'Conseil', "Mybooks & me" ]


livres = []

livres << "veZPDwAAQBAJ"
livres << "1fa2DwAAQBAJ"


livres << "3jihDwAAQBAJ"
livres << "fju3DwAAQBAJ"
livres << "PwSfDwAAQBAJ"
livres << "Dr2CDwAAQBAJ"
livres << "sgKfDwAAQBAJ"
livres << "AyOyDwAAQBAJ"
livres << "hfFIDwAAQBAJ"

livres << "TvWxDwAAQBAJ"
livres << "-si4DwAAQBAJ"
livres << "rtF-BgAAQBAJ"
livres << "RoOYDwAAQBAJ"
livres << "PgvoAwAAQBAJ"
livres << "UM5kPwAACAAJ"
livres << "vGvYBAAAQBAJ"
livres << "WazjBQAAQBAJ"
livres << "QTCxjwEACAAJ"
livres << "MEWlDwAAQBAJ"
livres << "MSCK1GwuiLUC"
livres << "5jLZBAAAQBAJ"
livres << "cxQQvgAACAAJ"
livres << "QLK7n9_28XkC"
livres << "D5ZLAgAAQBAJ"
livres << "4SxEKmerqPUC"
livres << "ThihCgAAQBAJ"
livres << "Bi-NDwAAQBAJ"
livres << "REC1DwAAQBAJ"
livres << "wA_Rp0rBKvsC"


Review.destroy_all
Reading.destroy_all
User.destroy_all
u = User.new
u.email = 'gigi@test.fr'
u.password = "password"
u.save!
livres.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!

  r = Reading.new
  r.livre = l
  r.user = u
  r.status = "done"


  sample = ActsAsTaggableOn::Tag.all.sample.name
  r.tag_list.add(sample)
  criteres = Critere.tagged_with(sample)
  note = ''
  criteres.each do |critere|
    note = note + rand(10).to_s + '/'
  end
  note = note + rand(10).to_s
  r.notation = note
  r.indice = calc_indice(note)
  r.save!



  puts book
  sleep 5
end



users = ['alain', 'olivier', 'rudy', 'corinne', 'barbara', 'damien', 'sandrine', 'lucien', 'alexandre', 'mohamed', 'justine', 'maria', 'magali', 'eric', 'frederic']

users.each do |user|

  u = User.new
  u.email = user+'@test.fr'
  u.password = 'password'
  u.save!

  l = Livre.find(117)
  r = Reading.new
  r.livre = l
  r.user = u
  r.status = "done"
  r.comment = Faker::Lorem.sentences(number: 3)
  r.like = rand(100)
  r.unlike = rand(100)
  r.tag_list.add("Heroic Fantasy")
  criteres = Critere.tagged_with("Heroic Fantasy")
  note = ''
  criteres.each do |critere|
    note = note + rand(10).to_s + '/'
  end
  note = note + rand(10).to_s
  r.notation = note
  r.indice = calc_indice(note)
  r.discover = DISCOVER.sample
  r.save!
  puts u.email
end





=begin




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

Review.destroy_all
Critere.destroy_all
Ending.destroy_all
Endinglist.destroy_all
Reading.destroy_all
Livre.destroy_all
User.destroy_all




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








liste = ["DSOyDwAAQBAJ", "MZmxDwAAQBAJ", "LEC1DwAAQBAJ", "DRe9DwAAQBAJ", "EH1oDwAAQBAJ", "HtPHtAEACAAJ"]


el = Endinglist.new
el.name = 'Nouveautés roman'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end


puts "Nouveautés roman done"

liste = ["FKeVDgAAQBAJ", "4eeGAQAAQBAJ", "OIarDgAAQBAJ", "Gpe4DwAAQBAJ", "USWJAQAAQBAJ", "35Z7DAAAQBAJ"]


el = Endinglist.new
el.name = 'Fantaisie'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end


puts "Fantaisie done"



liste = ["AyOyDwAAQBAJ", "VvqzDwAAQBAJ", "1fa2DwAAQBAJ", "5j6uDwAAQBAJ", "odjHDgAAQBAJ", "Foe5DwAAQBAJ", "5ZyuDwAAQBAJ", "zrexDwAAQBAJ"]


el = Endinglist.new
el.name = 'Nouveautés Polar Suspense'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end


puts "Nouveautés Polar Suspense done"









liste = ["ieDBAgAAQBAJ", "njARDQAAQBAJ", "FQtHBAAAQBAJ", "ThihCgAAQBAJ", "leASDgAAQBAJ", "1khmDwAAQBAJ", "QqVyDwAAQBAJ"]


el = Endinglist.new
el.name = 'Historique'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end


puts "Historique done"





liste = ["pgMmAgAAQBAJ", "Qs0QCwAAQBAJ", "PZaGAQAAQBAJ", "3QpMAAAAcAAJ", "Ck6TqBtR8qAC", "K8Gonq72BgEC"]

el = Endinglist.new
el.name = 'Horreur'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end


puts "Horreur done"




liste = ["3QpMAAAAcAAJ", "O1BSCwAAQBAJ", "Q3WZbrFB8asC",  "lW4zDQAAQBAJ"]

el = Endinglist.new
el.name = 'Science fictions'
el.save
liste.each do |book|
  url = "https://www.googleapis.com/books/v1/volumes/#{book}"
  f = open(url).read
  fj = JSON.parse(f)
  l = Livre.new

  l.imageurl = fj['volumeInfo']['imageLinks']['smallThumbnail']
  l.title =  fj['volumeInfo']['title']
  l.description = fj['volumeInfo']['description']
  l.author = fj['volumeInfo']['authors'].join(', ')
  l.googleid = book
  l.save!



  ending = Ending.new
  ending.livre = l
  ending.endinglist = el
  ending.save!
  puts book
  sleep 5

end

puts "Science fictions done"


=end
