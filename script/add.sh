#!/bin/bash

ID=$(echo $1 | grep -o 'wrld_[a-z0-9-]*')
TAGS="$2"

if [ -z "$TAGS" ]; then
  TAGS=$(
    cat asset/README | peco | awk '{print $1}'
  )
fi

bash ./script/world_thumbnail.sh "$ID" /tmp/out.png
for t in $TAGS; do
  if [ ! -d "asset/$TAG/" ]; then
    echo "Not found tag, $TAG"
    exit 1
  fi
  cp /tmp/out.png "asset/$t/$ID.png"
  echo Put "asset/$t/$ID.png"
done
rm /tmp/out.png
