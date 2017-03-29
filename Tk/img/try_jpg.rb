require 'tkextlib/tkimg'
myimg = TkPhotoImage.new(:file => 'NO.jpg')
root=TkRoot.new
label=TkLabel.new(root)
label['image'] = image