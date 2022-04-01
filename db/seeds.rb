# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recinto.create!(
  [
    {name: "UTEM Campus Macul"},
    {name: "UTEM Campus Casa Central"},
    {name: "UTEM Campus Providencia"}
  ]
)
Estudio.create!(
  [
    {name: "Ingeniería en Informática", code: "21030", recinto_id: 1},
    {name: "Ingeniería Civil en Computación", code: "21040", recinto_id: 1},
    {name: "Ingeniería en Geomensura", code: "21031", recinto_id: 1},
    {name: "3°Medio", code: "3", recinto_id: nil }
  ]
)
User.create!(
  [
    {name: "Alexander",
     first_last_name: "Rogers",
     second_last_name: "Valdes",
     dni: "196450319",
     password: "123456",
     role:"Admin",
     email: 'alexander.rogersv@utem.cl'},
    {name: "Javier Eduardo",
     first_last_name: "Rogers",
     second_last_name: "Valdes",
     dni: "196450319",
     password: "123456",
     role:"Tutor Disciplinar",
     email: 'jrogersp2000@gmail.com'},
  ]
)