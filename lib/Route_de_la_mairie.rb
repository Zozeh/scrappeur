
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#townhall_url
townhall_url="http://annuaire-des-mairies.com/95/viarmes.html"
def get_townhall_email(townhall_url)
	nom_pret=[]
	lien_pret=[]

	adresse = Nokogiri::HTML(open("#{townhall_url}"))
	a = adresse.css('td')[7].text
	return a

end

val_d_oise_town_urls = "http://annuaire-des-mairies.com/val-d-oise.html"
ville = Nokogiri::HTML(open(val_d_oise_town_urls))
def get_townhall_urls(val_d_oise_town_urls, ville)
#ville = Nokogiri::HTML(open(val_d_oise_town_urls))
tab_tout=ville.css('a[class="lientxt"]')

u=0
lien_pret=[]

for i in tab_tout
	#puts i
	result=i.to_s
	result=/[http](.*)[html]/.match(result).to_s.gsub('href=".','http://annuaire-des-mairies.com').gsub('txt" ','')
	lien_pret[u]=result
	#puts result
	u=u+1

end

#b = ville.css('a[class="lientxt"]')['href']

#puts nom_pret
#puts lien_pret
#hasy=Hash[a_pret.zip(b_pret)]
#puts ville.css('a[class="lientxt"]')
return lien_pret
end
#ville = Nokogiri::HTML(open(val_d_oise_town_urls))
nom_pret = ville.css('a[class="lientxt"]').text

lien_pret=get_townhall_urls(val_d_oise_town_urls,ville)
mail_pret=[]

for i in lien_pret
	puts get_townhall_email(i)
	
end

#puts lien_pret
