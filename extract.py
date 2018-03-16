import json

f = open('test.json', 'r')
json_dict = json.load(f)

print('{}'.format(json_dict['end']['streams'][0]['sender']['bits_per_second']))
