# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recinto.create!(
  [
    {nombre_recinto: "UTEM Campus Macul"},
    {nombre_recinto: "UTEM Campus Casa Central"},
    {nombre_recinto: "UTEM Campus Providencia"}
  ]
)
Estudio.create!(
  [
    {nombre_estudio: "Ingeniería en Informática", codigo: "21030", recinto_id: 1},
    {nombre_estudio: "Ingeniería Civil en Computación", codigo: "21040", recinto_id: 1},
    {nombre_estudio: "Ingeniería en Geomensura", codigo: "21031", recinto_id: 1},
    {nombre_estudio: "3°Medio", codigo: "3", recinto_id: nil }
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