
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Trader de l'obscur
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

a = page.css ('td[class="text-left col-symbol"]')
b = page.css ('td[class="no-wrap text-right"]')

a_pret=[]
t=0
for i in a
	result=i.to_s.gsub('<td class="text-left col-symbol">','')
	result=result.gsub('</td>','')
	a_pret[t]=result
	t=t+1
end

u=0
b_pret=[]
for i in b
	result=i.to_s
	result=/[>$](.*)[<]/.match(result).to_s.gsub('>$','').gsub('<','')
	b_pret[u]=result
	u=u+1
end

puts a_pret.length
puts b_pret.length


hasy=Hash[a_pret.zip(b_pret)]


puts hasy
