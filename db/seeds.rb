# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

  countries = Country.create([{ name: 'Bolivia'},{ name: 'Brazil'}])
  states = State.create([{ name: 'Beni', country: countries.first }, { name: 'Santa Cruz', country: countries.first }])
  City.create([{ name: 'Trinidad', state: states.first }, { name: 'Santa Ana de Yacuma', state: states.first }])


  practices = PracticeArea.create([{name: 'Agua', name_english: 'Water',name_portuguese: 'Agua'},{name: 'Otros', name_english: 'Others',name_portuguese: 'Otros'}])
  specialities = SpecialityArea.create([{name:  "Others", practice_area: practices.first},{name:'Prueba'}])

#   Mayor.create(name: 'Emanuel', city: cities.first)
