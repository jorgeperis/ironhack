# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
sandwiches = Sandwich.create([{ name: 'Club', bread_type: 'wheat'  }, { name: 'American', bread_type: 'wheat'}])
ingredients = Ingredient.create([{ name: 'Bacon', calories: 250  }, { name: 'Cheese', calories: 100}, { name: 'Tomato', calories: 20}, { name: 'Chicken', calories: 120}])
