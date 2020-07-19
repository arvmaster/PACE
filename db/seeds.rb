# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
                  email: 'alexander.rogersv@utem.cl',
                  password: '123456',
                  password_confirmation: '123456'
              }])/
    Asignatura.create!([
                           {nombre: 'Matematicas'},
                           {nombre: 'Lenguaje'},
                           {nombre: 'Física'},
                           {nombre: 'Historia'},
                           {nombre: 'Química'},
                           {nombre: 'Biologia'},
                           {nombre: 'Filosofia'}
                       ])
Archivo.create!([{
                     nombrearchivo: 'algebra',
                     estado: true,
                     asignatura_id: (Asignatura.find_by_nombre('matematicas')).id,
                 },
                 {
                     nombrearchivo: 'lectura',
                     estado: true,
                     asignatura_id: (Asignatura.find_by_nombre('lenguaje')).id
                 },
                 {
                     nombrearchivo: 'física',
                     estado: true,
                     asignatura_id: (Asignatura.find_by_nombre('ciencias')).id
                 }
                ])