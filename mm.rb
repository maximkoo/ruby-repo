require 'mini_magick'
image = MiniMagick::Image.open("IMG_20150625_065153.jpg")
image.path ##"IMG_20150625_065153.jpg"
image.resize "100x100"
image.format "png"
image.write "output.png"