# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

  countries =Country.create([{ name: 'Bolivia'},{ name: 'Brazil'}])
  cities = City.create([{ name: 'Beni', country: countries.first }, { name: 'Santa Cruz', country: countries.first }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
