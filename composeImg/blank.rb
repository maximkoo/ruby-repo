require 'mini_magick'
# Create a white png, 1024 x 768 pixels
MiniMagick::Tool::Convert.new do | new_image |
  new_image.size "1024x768"
  new_image.write("image.png");
end