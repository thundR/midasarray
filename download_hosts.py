import requests

url = 'https://v.firebog.net/hosts/lists.php?type=tick'
req = requests.get(url)
file = open("/opt/domain-blacklists/domains-blacklist.conf", "w")
file.write(req.text)
file.close()
