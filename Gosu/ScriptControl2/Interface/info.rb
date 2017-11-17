class Info<GameObject
	def initialize(obj, player)
		super(obj)
		@player=player;
		@text='';
	end;

	def update
		@text="Score: #{@player.score}";
	end;
	
	def draw
		ScreenPrinter.screenPrint(@text,50,50)
	end;	
end;