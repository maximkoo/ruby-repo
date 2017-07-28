module ArrayExtention
	def trans
        self.map!{|z| z.reverse!}
	end;     

	def flip
        s=self.map{|z|z.first}.max
        self.map!{|z| [s-z.first,z.last]}
	end;

	def flop
        s=self.map{|z|z.last}.max
        self.map!{|z| [z.first,s-z.last]}
	end;  

	def rotate
		sx=self.map{|z|z.first}.max 
		#sx=2 if sx<2
		sy=self.map{|z|z.last}.max
		#sy=2 if sy<2
		self.map!{|z|[sy-z.last,z.first]}
	end;  
end;