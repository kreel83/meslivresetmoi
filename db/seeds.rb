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

DISCOVER = ["Dans une libraire", "Emission de TV", "Magazine", "Conseil", "My Books & Me" ]

Critere.destroy_all
ActsAsTaggableOn::Tag.destroy_all
ActsAsTaggableOn::Tag.create(name: "Sciences fictions", color: "#F4C323")
ActsAsTaggableOn::Tag.create(name: "Heroic Fantasy", color: "#FF68AB")
ActsAsTaggableOn::Tag.create(name: "Livre de voyages", color: "#FF68AB")
ActsAsTaggableOn::Tag.create(name: "Roman XXeme siècle", color: "#9686FF")
ActsAsTaggableOn::Tag.create(name: "Roman US", color: "#86D3FF")
ActsAsTaggableOn::Tag.create(name: "Roman étranger", color: "#6FFF84")
ActsAsTaggableOn::Tag.create(name: "Policier", color: "#F4FFE8")
ActsAsTaggableOn::Tag.create(name: "Thriller", color: "#0040FF")

c = Critere.new(name: 'Charisme des personnages')
c.tag_list = "Sciences fictions,Roman étranger,Roman US, Livre de voyages, Thriller"
c.save
c = Critere.new(name: 'Immersion')
c.tag_list = "Sciences fictions,Thriller, Roman étranger, Roman XXeme siècle, Heroic Fantasy"
c.save
c = Critere.new(name: 'Sens du rythme')
c.tag_list = "Sciences fictions,Roman étranger, Heroic Fantasy, Thriller, Policier"
c.save
c = Critere.new(name: "Qualité de l'intrigue")
c.tag_list = "Livre de voyages,Roman étranger,Roman US, Policier, Roman XXeme siècle"
c.save
c = Critere.new(name: 'Style')
c.tag_list = "Sciences fictions,Roman étranger,Heroic Fantasy,Thriller, Livre de voyages"
c.save
c = Critere.new(name: 'Niveau de peur')
c.tag_list = "Sciences fictions,Roman XXeme siècle, Roman US, Roman étranger"
c.save
c = Critere.new(name: "Description de l'univers")
c.tag_list = "Heroic Fantasy,Roman étranger, Policier, Roman XXeme siècle, Livre de voyages"
c.save

puts 'done'

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
u.first_name = 'Gisèle'
u.last_name = "Delrosso"
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




reflivre = Livre.where(googleid: "wA_Rp0rBKvsC").first
u = User.where(email: 'gigi@test.fr').first


r = Reading.new
r.livre = Livre.find(reflivre.id)
r.status = 'ec'
r.user = u
r.save!


u = User.new
u.email = 'marc@test.fr'
u.password = 'password'
u.first_name = 'Marc'
u.last_name = 'Borgna'
u.save!



u = User.new
u.email = 'alexandre@test.fr'
u.password = 'password'
u.first_name = 'Alexandre'
u.last_name = 'Belet'
u.save!

r = Reading.new
r.livre = Livre.find(reflivre.id)
r.status = 'ec'
r.user = u
r.save!





users = ['alain', 'olivier', 'rudy', 'corinne', 'barbara', 'damien', 'sandrine', 'lucien', 'mohamed', 'justine', 'maria', 'magali', 'eric', 'frederic']

users.each do |user|

  u = User.new
  u.email = user+'@test.fr'
  u.password = 'password'
  u.first_name = user
  u.last_name = Faker::Name.first_name
  u.save!

  l = Livre.find(reflivre.id)
  r = Reading.new
  r.livre = l
  r.user = u
  r.status = "done"
  r.startdate = Faker::Date.between(from: 4.years.ago, to: Date.today)

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





livre 1 = ["D'un best seller on attend de la distraction , sans trop réfléchir. Cet opus lui c'est tout le contraire. Ici l'on est devant une remarquable initiative . L'auteur propose en effet un voyage au coeur des sciences ,pour que celles ci ne soient plus réservées aux scientifiques , aux esprits brillants . L'intention est plus que louable et l'on découvre ainsi pléthore de travaux scientifiques remarquablement décrits et accessibles a tous pour peu que l'on fasse un petit effort de curiosité",
"Dos Santos nous offre un très beau voyage dans l'univers au sens premier mais aussi dans l'univers des idées qu'elles soient religieuses, philosophiques ou scientifiques. J'ai lu certaines critiques qui jugeaient mal cet ouvrage car selon eux tout ça pour ça ! Je ne suis pas du tout d'accord avec leur vision de la chose. Je dirais même que la fin importe peu, n'est pas l'essentiel et on s'en fiche carrément",
"Que dire...si ce n'est que j'irai me coucher un peu plus intelligente ce soir?
Lecture assez ardue parce que, sur 600 pages, disons qu'il y en a au moins deux tiers consacrées à un cours de physique et à toutes les théories existantes. J'ai appris un tas de choses, j'en ai oubliées un tas aussi, et le reste, j'avoue que je n'en ai rien compris! le tiers restant étant consacré à l'histoire en elle-même, càd celle d'un cryptologue appelé à déchiffrer un texte d'Einstein et les aventures qui vont s'en découler",
"Voyage au coeur des Sciences dans ce roman de plus de 600 pages à la lecture ardue et intéressante qui maintient le suspense jusqu'à la fin....
Ce thriller scientifique pétri de théories nous entraîne dans le sillage de l'éminent cryptologue historien Portugais Thomas Noronha.
Il est le seul à pouvoir déchiffrer un manuscrit inédit d'Albert Einstein intitulé  La formule de Dieu",
"Parfois, je pense que la vie n'a aucune valeur, que c'est une chose insignifiante. Je vais mourir et l'humanité ne sentira pas la différence. L'humanité va mourir et l'éternité ne sentira pas la différence. Nous ne sommes que des ombres, de vaines poussières se perdant dans le temps ... Mais, d'autres fois, je pense que nous naissons tous avec une mission, que nous jouons tous un rôle, que nous faisons tous partie d'un système",
"Tout le cosmos repose sur les mathématiques. Les lois fondamentales de l'univers s'expriment par des équations et des formules mathématiques, les lois de la physique sont des algorithmes nécessaires au processus de l'information mathématique. Tout est relié, même ce qui ne le paraît pas. mais le langage mathématique lui-même ne peut décrypter totalement ce code. Telle est la propriété la plus énigmatique de l'univers : la manière dont celui-ci dissimule la vérité dernière"]




livre 2 = ["le temps que le journaliste passe à l’antenne à répéter la même chose pour vous faire croire que vous êtes informés, c’est autant de temps qu’il ne passe pas sur le terrain à recueillir l’information dont vous auriez vraiment besoin pour comprendre ce qu’il se passe",
"Je n'avais jamais entendu parler de Carlos Ruiz Zafon avant de le découvrir partout, sur tous les blogs et c'est une citation affichée sur mon site adoré www.pochetroc.fr qui a achevé de me convaincre. Je me suis donc intéressé à ce livre, son sujet, son ambiance. Il a donc fini par arriver dans ma boite à lettre, je me suis lancé, j'ai lu L'Ombre du vent",
"Passionnant, c'est le seul mot que j'utiliserai pour décrire ce livre, une plongée dans la ville de Barcelone après la guerre 40-45, à la fois historique et fantastique, ce roman ne se lâche pas avant la fin, et on se surprend à vouloir lire la suite immédiatement. Ce que j'ai fait avec le jeu de l'ange et le prisonnier du ciel.
Je n'ai qu'un mot à dire à ceux qui ne les ont pas lus, allez-y, vous resterez scotchés jusqu'au bout",
"C'est le premier roman de Carlos RUIZ ZAFON que je lis et c'est une découverte fantastique. Je viens juste de le refermer et j'avoue que j'ai du mal à m'en détacher.
Ce livre nous raconte l'histoire de Daniel SEMPERE qui se déroule dans Barcelone et débute en 1945. Il est orphelin de mère depuis qu'il est tout petit et aide son père qui tient une librairie. Ils s'aiment profondément tous les deux mais ont du mal à communiquer",
"Il existe des romans qui nous happent, nous envoutent, nous emmènent loin, très loin de chez nous. C'est un voyage immobile que l'on achève avec regret. Ce sont des personnages que l'on se surprend à aimer ou à connaître comme de vieux compagnons. Ils nous émeuvent, ils nous déçoivent, ils nous font peur, ils nous déroutent. « L'ombre du vent » est de la race de ces livres, du moins me concernant. Et ils sont rares",
"Rien ne marque autant un lecteur que le premier livre qui s'ouvre vraiment un chemin jusqu'à notre coeur. Ces premières images, l'écho de ces premiers mots que nous croyons avoir laissés derrière nous, nous accompagnent toute notre vie et sculptent dans notre mémoire un palais ou tôt ou tard - et peu importe le nombre de livres que nous lisons, combien d'univers nous découvrons-, nous reviendrons un jour",
"Il y a des rustres qui s'imaginent que s'ils mettent la main au cul d'une femme et qu'elle ne proteste pas, l'affaire est dans le sac. Ce sont des ignares. Le coeur de la femme est un labyrinthe de subtilités qui défie l'esprit grossier du mâle à l'affût. Si vous voulez vraiment posséder une femme, il faut d'abord penser comme elle, et la première chose est de conquérir son âme"]











# tableau d'id google
=begin
Review.destroy_all
Critere.destroy_all
Ending.destroy_all
Endinglist.destroy_all
Reading.destroy_all
Livre.destroy_all
User.destroy_all










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
