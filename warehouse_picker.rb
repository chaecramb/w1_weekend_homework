require "pry-byebug"

@bays = %w(a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10)

@inventory = {
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

def get_input(a, b)
  input = gets.chomp.downcase
  if input == a || input == b
    input
  else
    puts "Please enter \"#{a}\" or \"#{b}\""
    get_input(a, b)
  end
end
  
def get_bays  
  puts `clear`
  puts "Please enter a list of bays with a space in between each bay e.g.:"
  puts "a10 b3 c3 c3 a5"
  puts
  print "Enter bays: "
  gets.chomp.split
end

def list_items_in_bays(bays)
  items = []
  bays.each { |bay| items << @inventory[bay.to_sym] }
  items
end

def furthest_apart(bays)
  first = bays.first
  last =  bays.last
  bays.each do |b|
    first = b if @bays.index(b) < @bays.index(first)
    last = b if @bays.index(b) > @bays.index(last)
  end
  @bays.index(last) - @bays.index(first)
end

def check_for_invalid_products(products)
  invalid_products = products.select { |p| p unless @inventory.value?(p) }
  if invalid_products.any?
    products -= invalid_products
    puts "The following products are invalid: #{invalid_products.join(", ")}."
    puts "Would you like to (r)e-enter these products, or (c)ontinue without them?"
    add_more_products(products) if get_input("r", "c") == "r"
  else
    products
  end
end

def get_products
  puts `clear`
  puts "Available products:"
  puts "#{@inventory.values.join(", ")}"
  puts
  puts "Please enter a list of products with each product on a new line e.g.:"
  puts "rusty nail"
  puts "sharpie"
  puts "shoe lace"
  puts "shovel"
  puts "stop sign"
  puts
  puts "When you have finished your list press enter again."
  puts "(Press enter to continue)"
  gets
  puts "Enter your list:"
  products = []
  until products.last == ""
    products << gets.chomp.rstrip
  end
  products.pop
  check_for_invalid_products(products)
end

def add_more_products(products)
  puts `clear`
  puts "Available products:"
  puts "#{@inventory.values.join(", ")}"
  puts
  puts "Add extra products:"
  until products.last == ""
    products << gets.chomp.rstrip
  end
  products.pop

  check_for_invalid_products(products)
end

def ordered_bays(products)
  bays_to_be_visited = products.collect { |p| @inventory.key(p) }
  ordered_path = bays_to_be_visited.sort { |a, b| @bays.index(a.to_s) <=> @bays.index(b.to_s) }
end

puts `clear`
puts "Would you like to:"
puts "(a) Find products by bay number."
puts "(b) Find the most efficient route to collect your products."

case get_input("a", "b")
when "a" 
  bays = get_bays
  puts
  puts "The products in bays #{bays[0..-2].join(", ")} and #{bays.last}, in order are:" 
  puts list_items_in_bays(bays).join(", ")
  puts
  puts "The distance between the farthest apart items is: #{furthest_apart(bays)}"
  puts
  puts
  puts
when "b"
  puts
  products = get_products
  puts "Colect your products in this order:"
  puts ordered_bays(products)
  puts
  puts
  puts
end