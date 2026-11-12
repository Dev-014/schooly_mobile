import json
import urllib.request
import os
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

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

with open('/Users/admin/.gemini/antigravity-ide/brain/f8d0cf10-0171-4990-9529-a94acf595774/.system_generated/steps/3243/output.txt', 'r') as f:
    data = json.load(f)

for screen in data.get('screens', []):
    name = screen.get('title', '')
    if name in target_screens:
        download_url = screen.get('htmlCode', {}).get('downloadUrl')
        if download_url:
            filename = name.lower().replace("schooly admin - ", "").replace(" (copy)", "").replace(" (simple)", "").replace(" (simplified)", "").replace(" ", "_").replace("-", "_") + ".html"
            filepath = os.path.join('/tmp/academics', filename)
            
            try:
                html_req = urllib.request.Request(download_url)
                html_res = urllib.request.urlopen(html_req, context=ctx)
                html_content = html_res.read().decode('utf-8')
                with open(filepath, 'w') as out_f:
                    out_f.write(html_content)
                print(f"Downloaded {name} to {filepath}")
            except Exception as e:
                print(f"Failed to download {name}: {e}")

