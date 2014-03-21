# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

  countries =Country.create([{ name: 'Bolivia'},{ name: 'Brazil'}])
  states = State.create([{ name: 'Beni', country: countries.first }, { name: 'Santa Cruz', country: countries.first }])
  City.create([{ name: 'Trinidad', state: states.first }, { name: 'Santa Ana de Yacuma', state: states.first }])

#   Mayor.create(name: 'Emanuel', city: cities.first)
