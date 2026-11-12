import ssl
import urllib.request
import json
import os
import re

url = "https://stitch.withgoogle.com/projects/4384174600223581905"
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

req = urllib.request.Request(url)
response = urllib.request.urlopen(req, context=ctx)
html_str = response.read().decode('utf-8')

match = re.search(r'<script id="__NEXT_DATA__" type="application/json">(.+?)</script>', html_str)
if not match:
    print("Could not find __NEXT_DATA__")
    exit(1)

data = json.loads(match.group(1))
screens = data.get('props', {}).get('pageProps', {}).get('initialState', {}).get('project', {}).get('screens', [])

if not screens:
    # Alternative path
    screens = data.get('props', {}).get('pageProps', {}).get('project', {}).get('screens', [])

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

for screen in screens:
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

