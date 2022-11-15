#!/usr/bin/env python

import requests
from bs4 import BeautifulSoup

web_base="https://web.totsrucs.cat/"
URL = web_base+"index.php?pagina=infantil&ind=Tots"



page = requests.get(URL)


soup = BeautifulSoup(page.content, "html.parser")

results= soup.find(id="llista_elinks")

#print(results.prettify())


urls = results.findAll('a', href=True)

for line in urls:
  try:
    href=line['href']
    
    URL2=web_base+href
    page2 = requests.get(URL2)
    soup2 = BeautifulSoup(page2.content, "html.parser")
    results2= soup2.find(id="contingut")
    urls2 = results2.findAll('a', href=True)
    
    
    for line2 in urls2:
        try:
          href2=line2['href']
          
          URL3=web_base+href2
          page3 = requests.get(URL3)
          soup3 = BeautifulSoup(page3.content, "html.parser")
          results3= soup3.find_all("td",{"class":"nom"})
          
          for resultline in results3:  
            
            urls3 = resultline.findAll('a', href=True)
            
            for line3 in urls3:
              try:
                href3=line3['href']
                
                URL4=web_base+href3
                page4 = requests.get(URL4)
                soup4 = BeautifulSoup(page4.content, "html.parser")
                results4= soup4.find(id="contingut")
                urls4 = results4.findAll('a', href=True)
                
                for i in urls4:
                  print(line.text+"@@@"+line2.text+"@@@"+line3.text+"@@@"+i.text+"@@@@"+i['href'])
                
              except Exception as e: 
                print(e)
                pass
            
          
        except Exception as e: 
          print(e)
          pass
    
    
    
  except Exception as e: 
    print(e)
    pass
  



print("Finished")

