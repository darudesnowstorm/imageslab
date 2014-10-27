# Require the program to use the gem "./image_array.rb"
require './image_array.rb'
manip = true

# Ask the user what the name of the file to be manipulated is
while manip == true
puts "What is the name of the file that you would like manipulated?"
filename = gets.chomp
present = File.exist?(filename)
path = File.extname(filename)
if present == true and path == ".jpg"
  manip = false
  img = ImageArray.new(filename)
  end
end

# Ask the user how they would like to manipulate the file
puts "How would you like to manipulate your image?"
puts "Add a (t)int to the image."
puts "(I)nvert the colors of the image."
puts "Make the photo a (n)egative."
manipulation = gets.chomp

# Do the operation for adding a tint
if manipulation == "t" or manipulation == "T"
	puts "You have selected to manipulate the tint of an image."
	puts "What color would you like to change the tint of (R)ed, (B)lue or (G)reen."
	tintcolor = gets.chomp	
	if tintcolor == "r" or  tintcolor == "R" or tintcolor == "red" or tintcolor == "Red"
		img.each do |row|
			row.each do |pixel|
				pixel.red = img.max_intensity
			end
		end
	elsif tintcolor == "b" or tintcolor == "blue" or tintcolor == "B" or tintcolor == "Blue"
		img.each do |row|
			row.each do |pixel|
				pixel.blue = img.max_intensity
			end
		end
	elsif tintcolor == "g" or tintcolor == "G" or tintcolor == "Green" or tintcolor == "green"
		img.each do |row|
			row.each do |pixel|
				pixel.green = img.max_intensity
			end
		end
	end
img.write("t" + filename)
end 

# Put random noise on the image
if manipulation == "i" or manipulation == "I"
	puts "You have selected to make noise on the image."
		img.each do |row|
			row.each do |pixel|
				pixel.red = pixel.red**rand(2)
				pixel.green = pixel.green**rand(2)
				pixel.blue = pixel.blue**rand(2)
		end
	end
img.write("i" + filename)
end

# Make the image negative
if manipulation == "n" or manipulation == "N"
	puts "You have selected to make the image negative."
		img.each do |row|
			row.each do |pixel|
				pixel.red = img.max_intensity - pixel.red
				pixel.blue = img.max_intensity - pixel.blue
				pixel.green = img.max_intensity - pixel.green
		end
	end
img.write("n" + filename)
end
