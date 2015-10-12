=begin
Objects: 

Racking
Data: 
	bay numbers, products
	position
Behaviour:
	needs to be able to ask it:
		what products it has
		where products are in its bays

Picker
Data:
	list of bays
	list of products

Behaviour:
	Find product by bay
	Finy bay by product
	Find distance between products
	Find route to collect prohducts

=end

class Rack
	attr_reader :inventory
	@@racks = Array.new
	def initialize(name, ordered_inventory_list, next_rack, previous_rack)
		@name = name
		@inventory = ordered_inventory_list
		@next_rack = next_rack
		@previous_rack = previous_rack
		@@racks << self
	end

	def find_bays(*products)
		@inventory.collect { |product| @name.to_s + "#{@inventory.index(product) + 1}" }
	end

	def find_products(*bays)
		@inventory.select { |product| bays.include?(@inventory.index(product) + 1) }
	end

	def distance_between(p1, p2)
		p1 > p2 ? @inventory.index(p1) - @inventory.index(p2) : @inventory.index(p2) - @inventory.index(p1)
	end

	def next_rack
		@next_rack
	end

	def previous_rack
		@previous_rack
	end

	def self.racks
		@@racks
	end
end

rack_a = Rack.new(:a, ['a','b','c','d'], nil, :c)

puts rack_a.inventory
puts rack_a.find_bays("b", "c")
puts rack_a.distance_between("b","d")
puts rack_a.next_rack
puts rack_a.previous_rack
puts rack_a.find_products(1,4)
puts Rack.racks


class Picker
	#include get_input
	attr_accessor :rack

	def initialize(start_rack, start_bay)
		@rack = start_rack
		@bay = start_bay
	end

	def current_product
		
	end

	def current_bay
		@position
	end

	def input_products
		puts "Please enter products:"
		@shopping_list = get_string_list
	end

	def input_bays
		puts "Please enter products:"
		get_string_list
	end

	def collect_products
		@shopping_list.include?(current_position)
	end

end

picker_a = Picker.new(rack_a, 10)

puts picker_a.rack.find_products(1)



