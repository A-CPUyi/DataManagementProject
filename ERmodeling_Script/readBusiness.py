import json
import operator

dict ={}
dict1 ={}
dict2 ={}

filename = "business.json"
with open(filename, 'r', encoding='utf8', errors='ignore') as f:
    n = 0
    for line in f:
        data = json.loads(line)
        temp = data['categories']
        if temp:
            if 'Food' in temp or 'Restaurants' in temp:
                if data['attributes']:
                    for item in data['attributes'].keys():
                        if item in dict.keys():
                            dict[item] += 1
                        else:
                            dict.update({item : 1})
            if 'Shopping' in temp:
                if data['attributes']:
                    for item in data['attributes'].keys():
                        if item in dict1.keys():
                            dict1[item] += 1
                        else:
                            dict1.update({item : 1})
            if 'Beauty ' in temp or 'Hair Salons' in temp or 'Nail Salons' in temp:
                if data['attributes']:
                    for item in data['attributes'].keys():
                        if item in dict2.keys():
                            dict2[item] += 1
                        else:
                            dict2.update({item : 1})


print('FOOD')
templist = []
for item in dict.keys():
    if dict[item] < 10000:
        templist.append(str(item))
for k in templist:
    dict.pop(k)
for key, value in sorted(dict.items(), key=lambda item: item[1], reverse = True):
    print("%s: %s" % (key, value))

print()

print('SHOPPING')

templist = []
for item in dict1.keys():
    if dict1[item] < 1306:
        templist.append(str(item))
for k in templist:
    dict1.pop(k)
for key, value in sorted(dict1.items(), key=lambda item: item[1], reverse = True):
    print("%s: %s" % (key, value))

print()

print('BEAUTY')

templist = []
for item in dict2.keys():
    if dict2[item] < 1000:
        templist.append(str(item))
for k in templist:
    dict2.pop(k)
for key, value in sorted(dict2.items(), key=lambda item: item[1], reverse = True):
    print("%s: %s" % (key, value))

print('---Food---')
for item in dict.keys():
    if (not item in dict1.keys()) and (not item in dict2.keys()):
        print(item, dict[item])

print()

print('---Shopping---')
for item in dict1.keys():
    if (not item in dict.keys()) and (not item in dict2.keys()):
        print(item, dict1[item])

print()

print('---Beauty---')
for item in dict2.keys():
    if (not item in dict.keys()) and (not item in dict1.keys()):
        print(item, dict2[item])

print()
print('---Common---')
for item in dict.keys():
    if (item in dict1.keys()) and (item in dict2.keys()):
        print(item, dict[item])
