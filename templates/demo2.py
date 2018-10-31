
a=open('index.html','r',encoding='utf8')
b=a.read()
# print(b)
b=b.replace('src="..','src="')
print(b)
c=open('text.html',"w",encoding='utf8')
c.write(b)
