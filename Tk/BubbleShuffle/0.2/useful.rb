module Useful
	@arrows=Hash.new
	@arrows={"up"=>TkPhotoImage.new(:file => "./arrows/up.gif"),
		 	"left"=>TkPhotoImage.new(:file => "./arrows/left.gif"),
			"right"=>TkPhotoImage.new(:file => "./arrows/right.gif"),
			"down"=>TkPhotoImage.new(:file => "./arrows/Down.gif")}

	@colors=[TkPhotoImage.new(:file => "./gif/blank.gif"),
			 TkPhotoImage.new(:file => "./gif/yellow.gif"),
			 TkPhotoImage.new(:file => "./gif/blue.gif"),
			 TkPhotoImage.new(:file => "./gif/green.gif"),
			 TkPhotoImage.new(:file => "./gif/red.gif"),
			 TkPhotoImage.new(:file => "./gif/gray.gif"),			 
			 TkPhotoImage.new(:file => "./gif/aqua.gif"),			 
			 TkPhotoImage.new(:file => "./gif/pink.gif"),
			 TkPhotoImage.new(:file => "./gif/black.gif"),
			 TkPhotoImage.new(:file => "./gif/violet.gif"),	
			 TkPhotoImage.new(:file => "./gif/orange.gif"),	 
			 TkPhotoImage.new(:file => "./gif/white.gif")
			 ]

	@smalls=[TkPhotoImage.new(:file => "./small/blank.gif"),
			 TkPhotoImage.new(:file => "./small/yellow.gif"),
			 TkPhotoImage.new(:file => "./small/blue.gif"),
			 TkPhotoImage.new(:file => "./small/green.gif"),
			 TkPhotoImage.new(:file => "./small/red.gif"),
			 TkPhotoImage.new(:file => "./small/gray.gif"),			 
			 TkPhotoImage.new(:file => "./small/aqua.gif"),			 
			 TkPhotoImage.new(:file => "./small/pink.gif"),
			 TkPhotoImage.new(:file => "./small/black.gif"),
			 TkPhotoImage.new(:file => "./small/violet.gif"),	
			 TkPhotoImage.new(:file => "./small/orange.gif"),	 
			 TkPhotoImage.new(:file => "./small/white.gif")
			 ]

	@gameOver=TkPhotoImage.new(:file => "./others/gameover.gif")	 
	
	def Useful.getColors
		@colors
	end

	def Useful.getArrows
		@arrows
	end	

	def Useful.getSmalls
		@smalls
	end	

	def Useful.getGameOver
		@gameOver
	end	

	def Useful.getTurn(value)
		res="Turn number: #{value}"
		res
	end

	def Useful.getDropd(value)
		res="Bubbles popped last turn: #{value}"
		res
	end

	def Useful.getTotalDropd(value)
		res="Total bubbles popped: #{value}"
		res
	end

	def Useful.getScore(value)
		res="Last turn score: #{value}"
		res
	end

	def Useful.getTotalScore(value)
		res="Total score: #{value}"
		res
	end	 
end;  			
