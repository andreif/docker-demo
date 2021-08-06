import asyncio
import httpx
import json


async def get(pkg):
    async with httpx.AsyncClient() as client:
        return await client.get(f"https://pypi.org/pypi/{pkg}/json")


r = asyncio.run(get("httpx"))
print(r)
r.raise_for_status()
data = r.json()
data["info"].pop("description")
data.pop("releases")
print(json.dumps(data, indent=2))
