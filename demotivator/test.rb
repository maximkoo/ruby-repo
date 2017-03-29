require "mini_magick"
class Background<MiniMagick::Image
 def initialize(f)
  @a=File.read(f);
  @a.write "bg.jpg"
  @b=super("bg.jpg")
  @b
 end
end;

x=BBB.new("bg.jpg");
x.resize "300x300"

 