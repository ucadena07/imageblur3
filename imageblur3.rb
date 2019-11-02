class Image 
	def initialize(picture)
		@picture = picture
	end

	def find_ones
		ones = []

		@picture.each_with_index do |inner_array, outer_index|
			inner_array.each_with_index do |num, num_index|
				if num == 1
					ones << [outer_index, num_index]
				end
			end
		end
		ones
	end

	def blur(distance)
		ones = find_ones

		@picture.each_with_index do |inner_array, outer_index|
			inner_array.each_with_index do |num, num_index|
				ones.each do |found_outer_index, found_num_index|

					if manhathan_distance(outer_index,num_index,found_outer_index,found_num_index) <= distance
						@picture[outer_index][num_index] = 1
					end
				end
			end
		end

	end

	def manhathan_distance(x1,y1,x2,y2)
		horizontal_distance = ( x2 - x1 ).abs
		vertical_distance = ( y2 - y1 ).abs
		horizontal_distance + vertical_distance

	end

	def output_image
		@picture.each do |row|
			puts row.join
		end
	end

end

image = Image.new([
	[0,0,0,0],
	[0,0,0,0],
	[0,0,0,0],
	[0,0,0,0],
	[0,1,0,0],
	[0,0,0,0]

])

image.blur(3)
image.output_image