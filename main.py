import httpx
import json

r = httpx.get("https://pypi.org/pypi/httpx/json")
print(r)
r.raise_for_status()
data = r.json()
data["info"].pop("description")
data.pop("releases")
print(json.dumps(data, indent=2))
