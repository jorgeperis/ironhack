# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jorge = Player.create name: "Jorge"
laura = Player.create name: "Laura"
nera = Player.create name: "Nera"

football = Tournament.create name: "Futbol"
tenis = Tournament.create name: "Tenis"
skate = Tournament.create name: "Skate"

football.players.push(jorge)
tenis.players.push(laura)
tenis.players.push(nera)
skate.players.push(jorge)
skate.players.push(nera)
