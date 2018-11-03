a = open(r'floor2-lunbo.json','r',encoding='utf-8')
import json
b= a.read()
b=json.loads(b)
print(type(b))