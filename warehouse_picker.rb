bays = %w(a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10)

inventory = {
b7: "bath fizzers",
a3: "blouse",
a7: "bookmark",
c8: "candy wrapper",
c3: "chalk",
b10: "cookie jar",
b9: "deodorant",
c2: "drill press",
c6: "face wash",
a9: "glow stick",
a4: "hanger",
c10: "leg warmers",
a8: "model car",
b5: "nail filer",
a1: "needle",
c7: "paint brush",
b4: "photo album",
b3: "picture frame",
a10: "rubber band",
a5: "rubber duck",
c1: "rusty nail",
b2: "sharpie",
c9: "shoe lace",
a6: "shovel",
a2: "stop sign",
c5: "thermometer",
b8: "tissue box",
b6: "tooth paste",
c4: "word search" 
}

#Get list of bays
user_input_bays = ["c1","a4","b2","c10","c6","b3","a3","a4","a5","a10"]

#List items in those bays
items = []
user_input_bays.each { |bay| items << inventory[bay.to_sym] }
puts items

#Find farthest appart items


