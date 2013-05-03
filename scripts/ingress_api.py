import requests
import json
import conf

method = "dashboard.getThinnedEntitiesV2"

payload = {
    "method": method,
    "zoom": 17,
    "boundsParamsList": [
    {
        "id": "15_19804_10274",
        "qk": "15_19804_10274",
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
