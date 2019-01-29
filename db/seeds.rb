# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Charith",
             email: "charithsaivadla@commutatus.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

             User.create!(name:  "Charith",
                                       email: "charith@commutatus.com",
                                       password:              "foobar",
                                       password_confirmation: "foobar",
                                       activated: true,
                                       activated_at: Time.zone.now)


                                       User.create!(name:  "Charith3",
                                                                 email: "charith3@commutatus.com",
                                                                 password:              "foobar",
                                                                 password_confirmation: "foobar",
                                                                 activated: true,
                                                                 activated_at: Time.zone.now)

                                                                 User.create!(name:  "Charith2",
                                                                                           email: "charith2@commutatus.com",
                                                                                           password:              "foobar",
                                                                                           password_confirmation: "foobar",
                                                                                           activated: true,
                                                                                           activated_at: Time.zone.now)
