require 'net/http'

#Если мы хотим скачать страницу
url = URI.parse('http://www.example.com/index.html')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#добавим улицу в таблицу Street через приложение twoways
url = URI.parse('http://localhost:3000/external?p_name=')
req = Net::HTTP::Get.new(url.to_s+'QWERTY')
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body