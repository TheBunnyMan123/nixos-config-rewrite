#!/bin/sh
firefox-esr &

if ! pgrep keepassxc
then
	keepassxc --minimized
fi
