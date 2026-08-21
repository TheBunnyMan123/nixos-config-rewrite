#!/bin/sh

ALT_CONFIG="$HOME/.config/alt-instances/@PREFIX@"
ALT_DATA="$HOME/.local/share/alt-instances/@PREFIX@"
ALT_CACHE="$HOME/.cache/alt-instances/@PREFIX@"

mkdir -p "$ALT_CONFIG" "$ALT_DATA" "$ALT_CACHE"

exec @BWRAP@ \
	--bind / / \
	--dev /dev \
	--proc /proc \
	--bind "$ALT_CONFIG" "$HOME/.config" \
	--bind "$ALT_DATA" "$HOME/.local/share" \
	--bind "$ALT_CACHE" "$HOME/.cache" \
	-- \
	"@ORIG_BIN@" "$@"

