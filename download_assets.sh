#!/bin/bash
# Run this script from the seawar/ project root to download all assets from the original site.
# Usage: chmod +x download_assets.sh && ./download_assets.sh

BASE="https://game-seawar.com"
UA="Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36"

mkdir -p assets/img assets/pic assets/icons/base assets/icons/nav assets/icons/res

URLS=(
  "assets/img/piratgo_logox.jpg"
  "assets/img/start.png"
  "assets/img/logo_lux.jpg"
  "assets/img/more.jpg"
  "assets/pic/wargame.jpg"
  "assets/icons/base/dir.png"
  "assets/icons/nav/pirat.png"
  "assets/icons/res/money.png"
  "assets/icons/info.png"
)

for path in "${URLS[@]}"; do
  echo "Downloading: $path"
  curl -sL -o "$path" \
    -H "Referer: $BASE/" \
    -H "User-Agent: $UA" \
    "$BASE/$path"
done

echo ""
echo "Done. Check that files are real images (not 403 pages):"
file assets/img/piratgo_logox.jpg
echo ""
echo "If you see 'HTML' or 'ASCII text' instead of 'JPEG/PNG', the site may block downloads."
echo "In that case, open each URL in your browser and Save As manually."
