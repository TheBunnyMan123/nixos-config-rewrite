#!/usr/bin/env bash

echo "Listening to niri's event stream..."
niri msg --json event-stream \
	| jq --unbuffered -c '.' \
	| while read -r event
do
	if printf "%s" "$event" | jq -e 'has("WindowFocusChanged")' > /dev/null
	then
		app_id=$(niri msg --json focused-window | jq -r '.app_id // .title // "unknown"')
		printf "%s" "$app_id" > ~/Sync/figura/data/tmp/program_socket
	fi
done

