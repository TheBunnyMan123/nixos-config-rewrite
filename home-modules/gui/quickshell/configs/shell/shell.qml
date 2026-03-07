//@ pragma UseQApplication

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.modules.bar
import qs.modules.notifications

ShellRoot {
	id: root

	Bar {}

	Notifications {}
}
