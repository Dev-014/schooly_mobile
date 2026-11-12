import ssl
import urllib.request
import json
import os

url = "https://stitch.withgoogle.com/api/projects/4384174600223581905"
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

req = urllib.request.Request(url)
response = urllib.request.urlopen(req, context=ctx)
data = json.loads(response.read().decode('utf-8'))

target_screens = [
    "Schooly Admin - Co-Curricular Subjects",
    "Schooly Admin - Academic Session Setting (Copy)",
    "Schooly Admin - Class Management (Copy)",
    "Schooly Admin - Subject Management (Simplified)",
    "Schooly Admin - Promote Students (Simple) (Copy)",
    "Schooly Admin - Assign Class Teacher (Copy)",
    "Schooly Admin - Section Management"
]

os.makedirs('/tmp/academics', exist_ok=True)

for screen in data.get('screens', []):
    name = screen.get('name')
    if name in target_screens:
        download_url = screen.get('downloadUrl')
        if download_url:
            filename = name.lower().replace("schooly admin - ", "").replace(" (copy)", "").replace(" (simple)", "").replace(" (simplified)", "").replace(" ", "_").replace("-", "_") + ".html"
            filepath = os.path.join('/tmp/academics', filename)
            
            try:
                html_req = urllib.request.Request(download_url)
                html_res = urllib.request.urlopen(html_req, context=ctx)
                html_content = html_res.read().decode('utf-8')
                with open(filepath, 'w') as f:
                    f.write(html_content)
                print(f"Downloaded {name} to {filepath}")
            except Exception as e:
                print(f"Failed to download {name}: {e}")

