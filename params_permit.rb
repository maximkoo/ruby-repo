require 'action_controller';

# params = ActionController::Parameters.new(user: { name: "Francesco", age: 22, role: "admin" }) #рандомный список параметров
# puts params.permitted? #=> nil
# permitted = params.require(:user).permit(:name, :age)  #применяем к нему метод permit с фильтрами
# puts permitted.permitted?      # => true, т.е. список фильтрованный
# puts permitted.has_key?(:name) # => true
# puts permitted.has_key?(:age)  # => true
# puts permitted.has_key?(:role) # => false # такого параметра уже нет, его отфильтровали

# puts "----------------"

# prms=ActionController::Parameters.new({"utf8"=>"✓", "authenticity_token"=>"vRuZjlL5omupYS6Y/x0J6/qvYT4+T+fehEpTQcECaYg9ZNrp5jWAf0dR0sfzNfSOLyZ4HMR6PDYx0KuQMgUFXQ==", "author"=>{"nickname"=>"Super Hacker", "realname"=>"Вася Пипкин", "status"=>"Школьник", "advantage_ids"=>["1", "2", "3"]}, "commit"=>"Update Author", "id"=>"3"});
# puts prms["utf8"] #=>✓
# puts prms["authenticity_token"]; #=>vRuZjlL5omupYS6Y/x0J6/q...
# puts prms["author"] #=> {"nickname"=>"Super Hacker", "realname"=>"\u0412\u0430\u0441\u044F \u041F\u0438\u043F\u043A\u0438\u043D",....
# puts prms["author"]["nickname"] #=>Super Hacker
# puts prms["author"]["advantage_ids"].to_s #=>["1", "2", "3"]

# prms2=prms.permit("author": ["nickname", advantage_ids: []]);
# puts "--- What is left ---"
# prms2.each do |x|
# 	puts x
# end
# puts prms2.has_key?("author")
# puts prms2["author"]["realname"] #такого нет
# puts prms2["author"]["nickname"] #=>Super Hacker
# puts prms2["author"]["advantage_ids"].to_s  #=>["1", "2", "3"]

# puts "----------------"

# prms=ActionController::Parameters.new({"ololo"=>"trololo"})
# prms2=prms.permit("ololo");
# puts prms2["ololo"]

# prms=ActionController::Parameters.new({"ololo"=>"trololo", "user"=>{"first_name"=>"vasya", "last_name"=>"pipkin"} })
# # если элемент содержит хэш, то надо указать, какие ключи хэша разрешаются
# prms2=prms.permit("ololo", "user"=>"first_name")
# puts prms2["ololo"] #=> trololo
# puts prms2["user"]["first_name"] #=> vasya
# puts prms2["user"]["last_name"] #=> пусто

# prms=ActionController::Parameters.new({"ololo"=>"trololo", "users"=>["pupkin","pipkin","popkin"] })
# # если элемент содержит массив, то он разрешается вот так: 
# prms2=prms.permit("users"=>[])
# puts prms2["users"].to_s #=> ["pupkin","pipkin","popkin"]

# puts prms.permitted? #=> пусто
# puts prms2.permitted? #=> true

puts "--------------"

# prms=ActionController::Parameters.new({"utf8"=>"✓", "authenticity_token"=>"vRuZjlL5omupYS6Y/x0J6/qvYT4+T+fehEpTQcECaYg9ZNrp5jWAf0dR0sfzNfSOLyZ4HMR6PDYx0KuQMgUFXQ==", "author"=>{"nickname"=>"Super Hacker", "realname"=>"Вася Пипкин", "status"=>"Школьник", "advantage_ids"=>["1", "2", "3"]}, "commit"=>"Update Author", "id"=>"3"});
# # просто требуем одиночный параметр
# prms2=prms.require("utf8");
# # Требование несуществующий параметров приводик к ошибке
# #prms2=prms.require("utf7"); #=> Exception ActionController::ParameterMissing
# # Если ндо потребовать несколько параметров одного уровня 
# prms2=prms.require(["utf8",'authenticity_token'])

prms=ActionController::Parameters.new({"utf8"=>"✓", "authenticity_token"=>"vRuZjlL5omupYS6Y/x0J6/qvYT4+T+fehEpTQcECaYg9ZNrp5jWAf0dR0sfzNfSOLyZ4HMR6PDYx0KuQMgUFXQ==", "author"=>{"nickname"=>"Super Hacker", "realname"=>"Вася Пипкин", "status"=>"Школьник", "advantage_ids"=>["1", "2", "3"]}, "commit"=>"Update Author", "id"=>"3"});
prms2=prms.select{|x| x=="author"}
prms3=prms2["author"].select{|x| ["nickname",'realname',"status","advantage_ids"].include?(x)}
puts prms2
puts prms3
