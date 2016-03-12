# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = Activity.create(title: "Gokart", description: "Drive a fast car!", location: "Downtown Oslo", image: "http://faavangamerikanerklubb.org/wp-content/uploads/2013/09/go-kart.jpg")

a2 = Activity.create(title: "Frogner Paintball", description: "Skyt hverandre så det gjør vondt!!!!", location: "Frogner", image: "https://i.ytimg.com/vi/r2g4vQR_1i8/maxresdefault.jpg")

a3 = Activity.create(title: "Shopping på Arkaden", description: "Shope til u drope!", location: "Arkaden", image: "http://i.livescience.com/images/i/000/002/542/i02/080919-shopping-woman-02.jpg?1296072865")