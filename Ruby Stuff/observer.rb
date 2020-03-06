# Предположим речь идет о какой-нить реалистичной видеоигре
# Когда в игре происходит выстрел, на экране появляется вспышка, а в наушниках слышен грохот
# Когда в игре идёт снег, на экране становится бело, а наушниках ничего не происходит
# Когда в игре звонит телефон, на экране ничего не происходит, а в наушниках слышен вызов

class Observer # родитель всех наблюдателей, может быть просто интерфейсом
	def onNotify(event_type)
	end;
end;

class VideoObserver<Observer # наблюдатель за видео событиями
	def onNotify(event_type)
		puts "Bang on the screen" if event_type==BANG_EVENT
		puts "White on the screen" if event_type==SNOW_EVENT
	end;
end;

class AudioObserver<Observer # наблюдатель за аудио событиями
	def onNotify(event_type)
		puts "Bang in the headphones" if event_type==BANG_EVENT
		puts "Beep in the headphones" if event_type==BEEP_EVENT
	end;
end;

# Типы событий
BANG_EVENT=1
SNOW_EVENT=2
BEEP_EVENT=3

class Game
	#attr_accessor :event_type
	def initialize
		@observers=[VideoObserver.new, AudioObserver.new] # здесь список наблюдателей заведен руками, иногда делают API для их программного создания и удаления
	end;	

	def notifyObservers(event_type)
		@observers.each do |x| # оповещаем всех наблюдателей
			x.onNotify(event_type); # о таком-то событии
		end;	
	end;

	def shoot	
		puts "BANG!"
		notifyObservers(BANG_EVENT) # оповещаем!
	end;	

	def snow	
		puts "SNOW!"
		notifyObservers(SNOW_EVENT) # оповещаем!
	end;

	def phone
		puts "BEEP!"
		notifyObservers(BEEP_EVENT) # оповещаем!
	end;	
end;


g=Game.new
g.shoot
g.snow
g.phone

# ---
# BANG!
# Bang on the screen
# Bang in the headphones
# SNOW!
# White on the screen
# BEEP!
# Beep in the headphones
# [Finished in 0.2s]