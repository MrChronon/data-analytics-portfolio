import os
import time
import requests

BASE_URL = os.environ["AMO_BASE_URL"].rstrip("/")
TOKEN = os.environ["AMO_ACCESS_TOKEN"]

headers = {"Authorization": f"Bearer {TOKEN}"}
problem_leads = []
now = int(time.time())
page = 1

while True:
    response = requests.get(
        f"{BASE_URL}/api/v4/leads",
        headers=headers,
        params={"page": page, "limit": 250},
        timeout=15,
    )
    response.raise_for_status()
    data = response.json()

    for lead in data.get("_embedded", {}).get("leads", []):
        # Закрытые сделки не требуют следующей задачи
        if lead.get("status_id") in (142, 143):
            continue

        task_at = lead.get("closest_task_at")

        if task_at is None:
            problem_leads.append(
                (lead["id"], lead["name"], "нет задачи")
            )
        elif task_at < now:
            problem_leads.append(
                (lead["id"], lead["name"], "задача просрочена")
            )

    if "next" not in data.get("_links", {}):
        break

    page += 1

for lead_id, name, reason in problem_leads:
    print(f"{lead_id}: {name} - {reason}")
