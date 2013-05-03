import requests
import json

ACSID = ""
csrftoken = ""
lat = ""
lon = ""
plid = ""
plqk = ""

playload = """{"method":"dashboard.getThinnedEntitiesV2","minLevelOfDetail":-1,"boundsParamsList":[{"id":"012023003213301030","qk":"012023003213301030","minLatE6":47333239,"minLngE6":13298950,"maxLatE6":47335100,"maxLngE6":13301697}]}"""
url = """http://www.ingress.com/rpc/dashboard.getThinnedEntitiesV2"""
cookie = "ACSID=; ingress.intelmap.lat=; ingress.intelmap.lng=; ingress.intelmap.zoom=; csrftoken=""
headers = {
"Host":"www.ingress.com",
"Origin":"http://www.ingress.com",
"Referer":"http://www.ingress.com/intel?ll=55.726337,37.788849&z=10",
"User-Agent":"Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31",
"X-CSRFToken":"OpKdCzFaSiJOZ55K8TcKAkF96pJWtZnt",
"X-Requested-With":"XMLHttpRequest"
}

r = requests.post(url, data=json.loads(payload), headers=headers, cookies=cookies)

print r.text
