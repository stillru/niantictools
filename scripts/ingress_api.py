import requests
import json
import conf

method = "dashboard.getThinnedEntitiesV2"

payload = {
    "method": method,
    "zoom": 11,
    "boundsParamsList": [
    {
        "id": "16_39620_20476",
        "qk": "16_39620_20476",
        "minLatE6": 55559709,
        "minLngE6": 37573242,
        "maxLatE6": 55565922,
        "maxLngE6": 37584229
    },
    ]
}

url = "http://www.ingress.com/rpc/" + method
cookies = {
    "ACSID": conf.ACSID,
    "csrftoken": conf.csrftoken,
    "ingress.intelmap.lat": "55.789194370444655",
    "ingress.intelmap.lng": "37.63836622238159",
    "ingress.intelmap.zoom": "11",
    "ingress.intelmap.type": "2"
#    "__utma": "24037858.1611298711.1359959785.1367483667.1367607050.44",
#    "__utmb": "24037858.1.10.1367607050",
#    "__utmc": 24037858,
#    "__utmz=24037858.1367479669.42.8.utmcsr=justmynotes.ru|utmccn=(referral)|utmcmd=referral|utmcct": "/files/031.html"
}
headers = {
    "Host": "www.ingress.com",
    "Origin": "http://www.ingress.com",
    "Referer": "http://www.ingress.com/intel",
    "User-Agent": "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31",
    "X-CSRFToken": conf.csrftoken,
    "X-Requested-With": "XMLHttpRequest",
    "Content-type": "application/json; charset=UTF-8"
}

r = requests.post(
    url,
    data=json.dumps(payload),
    headers=headers,
    cookies=cookies
)

print json.dumps(json.loads(r.text), indent=4)
