#!/bin/bash

USERAGENT="cympfh/VRCDynamicPoster"

# ワールドのサムネイル画像を取得する
ID=$(echo $1 | grep -o 'wrld_[a-z0-9-]*')
OUT=$2
echo WORLD_ID is $ID
echo "https://vrchat.com/home/launch?worldId=$ID"
IMURL=$(
  curl -sL -A $USERAGENT "https://vrchat.com/home/launch?worldId=$ID" |
    web-grep '<meta name="og:image" content={} />' |
    head -1
)
echo Downloading "$IMURL" as "$OUT"
curl -sL -A $USERAGENT "$IMURL" > "$OUT"
