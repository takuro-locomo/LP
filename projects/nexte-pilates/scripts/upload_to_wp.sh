#!/bin/bash
# LP を studio-nexte WordPress の固定ページ311に下書き保存する
# 使い方: WP_USER=xxx WP_APP_PASS='xxxx xxxx xxxx xxxx xxxx xxxx' bash scripts/upload_to_wp.sh
set -euo pipefail

SITE="https://studio-nexte.ueno-wellness-nexta.com"
PAGE_ID=311
LP_FILE="$(dirname "$0")/../lp/machine-pilates-mastery.html"

: "${WP_USER:?WP_USER を指定してください}"
: "${WP_APP_PASS:?WP_APP_PASS を指定してください}"

# <body>内のみ抽出し、<style>はそのまま先頭に含める（WPカスタムHTMLとして保存）
python3 - "$LP_FILE" << 'EOF' > /tmp/lp_wp_content.html
import re, sys
html = open(sys.argv[1], encoding='utf-8').read()
style = re.search(r'<style>.*?</style>', html, re.S).group(0)
body = re.search(r'<body>(.*)</body>', html, re.S).group(1)
fonts = '\n'.join(re.findall(r'<link[^>]*fonts[^>]*>', html))
print(f'<!-- wp:html -->\n{fonts}\n{style}\n{body}\n<!-- /wp:html -->')
EOF

python3 - << EOF
import json, requests
content = open('/tmp/lp_wp_content.html', encoding='utf-8').read()
r = requests.post(
    "$SITE/wp-json/wp/v2/pages/$PAGE_ID",
    auth=("$WP_USER", "$WP_APP_PASS"),
    json={
        "title": "長野市のマシンピラティス習得コース｜全8回で「教えられる」を目指す｜Studio NEXTE",
        "content": content,
        "status": "draft",
    },
    timeout=60,
)
print(r.status_code)
d = r.json()
print(d.get("link") or d)
EOF
