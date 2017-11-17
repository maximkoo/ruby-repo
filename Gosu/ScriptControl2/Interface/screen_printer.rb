class ScreenPrinter
	def self.screenPrint(str, x,y)
    	xc=x
    	str.split("").each do |s|    		
    		FONT[s].draw(xc,y,INTERFACE_LAYER, SCALER, SCALER) unless s==' '
    		xc+=FONT[s].width*SCALER;
    	end;
	end;	
end;