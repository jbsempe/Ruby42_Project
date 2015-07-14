# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "jb", password: "coucou")
User.create!(email: "chab", password: "coucou")
User.create!(email: "vincent", password: "coucou")

Pack.create!(title: "pack1", description:"pack1Desc", quantity: 1, format: 1, ingraving: 1, vinyl_colors: 1, label: 1, external_sleeve: 1, sleeve: 1, packaging: 1, weight: 1)
Pack.create!(title: "pack2", description:"pack2Desc", quantity: 0, format: 1, ingraving: 1, vinyl_colors: 1, label: 1, external_sleeve: 1, sleeve: 1, packaging: 1, weight: 1)
Pack.create!(title: "pack3", description:"pack3Desc", quantity: 1, format: 0, ingraving: 1, vinyl_colors: 1, label: 1, external_sleeve: 1, sleeve: 1, packaging: 1, weight: 1)

Client.create!(email: "jb@sempe.me")
Client.create!(email: "chab@sempe.me")
Client.create!(email: "vincent@sempe.me")

Order.create!(artist_name: "Fuzati", album_title: "Vive la vie", label_name: "Oxmo", num_cat: 65, delivery_price: 132, status: "En Livraison", total_price: 978, quantity: 0, format: 0, ingraving: 1, vinyl_colors: 1, label: 1, external_sleeve: 1, sleeve: 1, packaging: 1, weight: 1, pack_id: 1, client_id: 1)
Order.create!(artist_name: "Fuzati2", album_title: "Vive la vie", label_name: "Oxmo", num_cat: 65, delivery_price: 132, status: "En Livraison", total_price: 978, quantity: 1, format: 1, ingraving: 1, vinyl_colors: 1, label: 0, external_sleeve: 0, sleeve: 0, packaging: 0, weight: 0, pack_id: 2, client_id: 2)
Order.create!(artist_name: "Fuzati3", album_title: "Vive la vie", label_name: "Oxmo", num_cat: 65, delivery_price: 132, status: "En Livraison", total_price: 978, quantity: 0, format: 1, ingraving: 1, vinyl_colors: 0, label: 1, external_sleeve: 1, sleeve: 1, packaging: 1, weight: 1, pack_id: 3, client_id: 3)

#Client.create!(email: "jb@sempe.me")